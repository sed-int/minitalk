# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcho2 <hcho2@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 15:29:25 by hcho2             #+#    #+#              #
#    Updated: 2023/07/19 14:59:25 by hcho2            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror

SOURCES = \
	ft_lstclear.c ft_putchar_fd.c ft_strmapi.c ft_atoi.c ft_lstdelone.c \
	ft_putendl_fd.c ft_strncmp.c ft_bzero.c ft_lstiter.c ft_putnbr_fd.c \
	ft_strnstr.c ft_calloc.c ft_putstr_fd.c ft_strrchr.c ft_isalnum.c \
	ft_split.c ft_strtrim.c ft_isalpha.c ft_lstnew.c ft_strchr.c ft_substr.c \
	ft_isascii.c ft_strdup.c ft_tolower.c ft_isdigit.c ft_memchr.c ft_striteri.c \
	ft_toupper.c ft_isprint.c ft_memcmp.c ft_strjoin.c ft_itoa.c ft_strcmp.c \
	ft_memcpy.c ft_strlcat.c ft_memmove.c ft_strlcpy.c ft_memset.c ft_strlen.c \
	get_next_line.c

BSOURCES = \
	ft_lstadd_back.c ft_lstdelone.c ft_lstmap.c ft_lstadd_front.c \
	ft_lstiter.c ft_lstnew.c ft_lstclear.c ft_lstlast.c ft_lstsize.c

OBJECTS = $(SOURCES:.c=.o)
BOBJECTS = $(BSOURCES:.c=.o)

all bonus:
	@rm -f all bonus $(NAME)
	@ar -rcs $(NAME) $^
	@touch $@

all: $(OBJECTS)

$(NAME): all
		@echo $(GREEN)"\n============================================================\n" $(EOC)
		@echo $(YELLOW)"                        LIBFT DONE                          " $(EOC)
		@echo $(GREEN)"\n============================================================\n" $(EOC)

bonus: $(OBJECTS) $(BOBJECTS)

%.o: %.c
	@$(CC) -c $(CFLAGS) $?

clean:
	@rm -f $(OBJECTS) $(BOBJECTS) all bonus

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: clean fclean re
