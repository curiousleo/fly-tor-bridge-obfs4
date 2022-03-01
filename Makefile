fly.toml:
	./deploy

.PHONY: deploy
launch: fly.toml

bridge-line: fly.toml
	./bridge-line
