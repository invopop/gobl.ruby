const fs = require('fs');
const path = require('path');
const {
    quicktype,
    InputData,
    JSONSchemaInput,
    FetchingJSONSchemaStore,
} = require("quicktype-core");

const schemaDir = 'schema';
const libDir = 'lib/gobl';
const namespaces = [
    'Note',
    'Tax',
    'Num',
    'Org',
    'Uuid',
    'Bill',
    'Dsig',
    'Currency',
    'I18n',
    'Pay'
]

function readAllFolder(dirMain, acc = []) {
    const dir = fs.readdirSync(dirMain);

    dir.forEach((dirNext) => {
        let subDir = dirMain + "/" + dirNext;

        if (fs.lstatSync(subDir).isDirectory()) {
            readAllFolder(subDir, acc);
        } else {
            acc.push(subDir);
        }
    });

    return acc;
}

function clearNames(content) {
    let clsNameRE = new RegExp('Schema(.*)JSON', 'g');
    let attNameRE = new RegExp('schema_(.*)_json', 'g');

    return content
        .replace(clsNameRE, (_, name) => name)
        .replace(attNameRE, (_, name) => name);
}

function addNamespaces(content) {
    let newClassNames = {};

    content.replace(/class (.+) <.+\n/g, (_, name) => {
        newClassNames[name] = 'GOBL::' + name;
    });

    namespaces.forEach(ns => {
        let namespaceRE = new RegExp('class ' + ns + '(.+) <.+\n', 'g');

        content.replace(namespaceRE, (_, name) => {
            newClassNames[ns + name] = 'GOBL::' + ns + '::' + name;
        });
    });

    return Object.entries(newClassNames).reduce((acc, [prev, post]) => {
        return acc.replace(new RegExp(prev, 'g'), post);
    }, content);
}

function removeTypes(content) {
    let moduleTypesRE = new RegExp('module Types(.|\n)*?end');

    return content.replace(moduleTypesRE, '');
}

async function quicktypeJSONSchema(file, targetLanguage) {
    const jsonSchemaString = fs.readFileSync(file, 'utf-8');

    if (!JSON.parse(jsonSchemaString).definitions) {
        return Promise.resolve({ lines: undefined });
    }

    const schemaInput = new JSONSchemaInput(new FetchingJSONSchemaStore());
    await schemaInput.addSource({ name: file, schema: jsonSchemaString });

    const inputData = new InputData();
    inputData.addInput(schemaInput);

    return await quicktype({
        inputData,
        lang: targetLanguage,
    });
}

async function main() {
    for (const file of readAllFolder(schemaDir)) {
        const { lines: content } = await quicktypeJSONSchema(file, 'ruby');

        if (content) {
            const newPath = file.replace(schemaDir, libDir);
            const basename = path.basename(newPath, path.extname(newPath));
            newFile = path.join(path.dirname(newPath), basename + '.rb');

            const output = addNamespaces(content.map(clearNames).join("\n"));

            fs.writeFileSync(newFile, removeTypes(output));
        }
    }
}

main();
