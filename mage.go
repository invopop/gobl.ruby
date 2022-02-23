//go:build mage
// +build mage

package main

import (
	"github.com/magefile/mage/sh"
)

const (
	name     = "gobl.ruby"
	runImage = "ruby:2.7"
)

// Install runs bundle install
func Install() error {
	return dockerRunCmd(name+"-install", "", "bundle", "install")
}

// Generate uses the schema to generate the ruby structures
func Generate() error {
	return dockerRunCmd(name, "", "rake", "generate")
}

func Spec() error {
	return dockerRunCmd(name, "", "rake", "spec")
}

func dockerRunCmd(name, publicPort string, cmd ...string) error {
	args := []string{
		"run",
		"--rm",
		"--name", name,
		"--network", "invopop-local",
		"-v", "$PWD:/app",
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
	args = append(args, runImage)
	args = append(args, cmd...)
	return sh.RunV("docker", args...)
}

// Shell runs an interactive shell within a docker container.
func Shell() error {
	return dockerRunCmd(name+"-shell", "", "bash")
}
