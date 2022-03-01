fly.toml:
	./deploy

.PHONY: deploy
deploy: fly.toml

.PHONY: bridge-line
bridge-line: fly.toml
	./bridge-line
