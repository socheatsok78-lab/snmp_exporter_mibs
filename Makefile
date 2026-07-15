it: mibs
clean:
	rm -rf $(PWD)/mibs || true
mibs:
	docker buildx bake
