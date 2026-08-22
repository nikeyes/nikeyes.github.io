.DEFAULT_GOAL := serve

IMAGE  := ruby:3.3
NAME   := nikeyes-blog
STOP    = @docker stop $(NAME) >/dev/null 2>&1 || true
DOCKER := docker run --rm --platform linux/amd64 \
            -v "$(CURDIR)":/srv/jekyll \
            -v jekyll_gems:/usr/local/bundle \
            -w /srv/jekyll

.PHONY: serve clean

serve: ## http://localhost:4000, recarga al guardar, incluye los borradores. Ctrl+C para parar.
	$(STOP)
	$(DOCKER) -it --name $(NAME) -p 4000:4000 -p 35729:35729 $(IMAGE) sh -c \
		"bundle check >/dev/null 2>&1 || bundle install; \
		 bundle exec jekyll serve --host 0.0.0.0 --livereload --force_polling --unpublished"

clean: ## Para el servidor y borra el sitio generado y la cache
	$(STOP)
	rm -rf _site .jekyll-cache
