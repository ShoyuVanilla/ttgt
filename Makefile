.PHONY: deploy
deploy: book
	mdbook build
	@echo "====> deploying to github"
	# git worktree add /tmp/book gh-pages # Uncomment on new machines
	rm -rf /tmp/book/*
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
		git checkout -- CNAME &&\
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push origin gh-pages