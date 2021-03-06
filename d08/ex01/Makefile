# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/20 11:16:05 by jaguillo          #+#    #+#              #
#    Updated: 2015/06/25 13:20:09 by jaguillo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := a.out

OBJS_DIR := bin/
SRCS_DIR := ./

SRCS := atom.ml molecule.ml

FLAGS := -I $(OBJS_DIR)
LIBS :=

BYT_OBJS := \
	$(addprefix $(OBJS_DIR),$(SRCS:.ml=.cmo))
OPT_OBJS := \
	$(addprefix $(OBJS_DIR),$(SRCS:.ml=.cmx))
GARBAGES := \
	$(addprefix $(OBJS_DIR),$(SRCS:.ml=.cmi)) \
	$(addprefix $(OBJS_DIR),$(SRCS:.ml=.o))

all: $(NAME)

$(NAME): $(OBJS_DIR)$(NAME).byt $(OBJS_DIR)$(NAME).opt
	@ln -sf $(OBJS_DIR)$(NAME).opt $@
	@echo "\033[32m$@\033[0m"

byt: $(OBJS_DIR)$(NAME).byt
	@ln -sf $(OBJS_DIR)$(NAME).byt $(NAME)
	@echo "\033[32m$@\033[0m"

$(OBJS_DIR)$(NAME).byt: $(OBJS_DIR) $(BYT_OBJS)
	@ocamlc $(LIBS) -g -o $@ $(BYT_OBJS)

opt: $(OBJS_DIR)$(NAME).opt
	@ln -sf $(OBJS_DIR)$(NAME).opt $(NAME)
	@echo "\033[32m$@\033[0m"

$(OBJS_DIR)$(NAME).opt: $(OBJS_DIR) $(OPT_OBJS)
	@ocamlopt $(LIBS) -o $@ $(OPT_OBJS)

.depend: Makefile $(SRCS_DIR)
	@ocamldep -I $(SRCS_DIR) $(addprefix $(SRCS_DIR),$(SRCS)) | \
		sed -E 's;[^ \./]+\.[^ :]+;$(OBJS_DIR)&;g' > .depend

$(OBJS_DIR)%.cmo: $(SRCS_DIR)%.ml
	@ocamlc -g $(FLAGS) -o $@ -c $<
	@echo "\033[92m$@\033[0m"

$(OBJS_DIR)%.cmx: $(SRCS_DIR)%.ml
	@ocamlopt $(FLAGS) -o $@ -c $<
	@echo "\033[92m$@\033[0m"

$(OBJS_DIR)%.cmi: $(SRCS_DIR)%.mli
	@ocamlopt -I $(OBJS_DIR) -o $@ -c $<
	@echo "\033[93m$@\033[0m"

$(OBJS_DIR) $(SRCS_DIR):
	@mkdir -p $@

i:
	@for i in $(SRCS); do \
		echo "\033[33m --> $$i\033[0m"; \
		ocamlopt $(FLAGS) -i $$i; \
	done

clean:
	@rm -f $(BYT_OBJS) $(OPT_OBJS) $(GARBAGES)

fclean: clean
	@rm -f .depend $(NAME) $(OBJS_DIR)$(NAME).opt $(OBJS_DIR)$(NAME).byt
	@rmdir $(OBJS_DIR) 2> /dev/null || true

re: fclean all

.PHONY: all clean fclean re opt

-include .depend
