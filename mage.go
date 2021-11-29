//go:build mage
// +build mage

package main

import (
	"github.com/magefile/mage/sh"
)

const (
	name       = "gobl.ruby"
	buildImage = "node:12"
	runImage   = "ruby:2.7"
)

// Install runs npm install
func Install() error {
	return dockerRunCmd(buildImage, name+"-install", "", "npm", "install")
}

// Generate uses the schema to generate the ruby structures
func Generate() error {
	return dockerRunCmd(buildImage, name, "", "npm", "run", "generate")
}

// Bundle runs bundle install
func Bundle() error {
	return dockerRunCmd(runImage, name, "", "bundle", "install")
}

func dockerRunCmd(image, name, publicPort string, cmd ...string) error {
	args := []string{
		"run",
		"--rm",
		"--name", name,
		"--network", "invopop-local",
		"-v", "$PWD:/app",
		"-v", "$PWD/node_modules:/app/node_modules",
		"-v", "$PWD/.tmp_bundle:/usr/local/bundle",
		"-w", "/app",
		"-it", // interactive
		// "--entrypoint=rake",
	}
	if publicPort != "" {
		args = append(args,
			"--label", "traefik.enable=true",
			"--label", "traefik.http.routers."+name+".rule=Host(`"+name+".invopop.dev`)",
			"--label", "traefik.http.routers."+name+".tls=true",
			"--expose", publicPort,
		)
	}
	args = append(args, image)
	args = append(args, cmd...)
	return sh.RunV("docker", args...)
}

// Shell runs an interactive shell within a docker container.
func Shell() error {
	return dockerRunCmd(runImage, name+"-shell", "", "bash")
}
