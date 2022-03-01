fly.toml:
	./deploy

.PHONY: deploy
deploy: fly.toml

bridge-line: fly.toml
	./bridge-line
