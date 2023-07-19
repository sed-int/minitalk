# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcho2 <hcho2@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/19 13:40:03 by hcho2             #+#    #+#              #
#    Updated: 2023/07/19 14:01:10 by hcho2            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#-------------------------------------------

BLACK       =   "\033[0;30m"
GRAY        =   "\033[1;30m"
RED         =   "\033[1;31m"
GREEN       =   "\033[0;32m"
YELLOW      =   "\033[1;33m"
PURPLE      =   "\033[0;35m"
CYAN        =   "\033[1;36m"
WHITE       =   "\033[1;37m"
EOC         =   "\033[0;0m"
LINE_CLEAR  =   "\x1b[1A\x1b[M"

#-------------------------------------------

LIBFT		= ./libft/libft.a
SRC			= server.c client.c

OBJ			= $(SRC:.c=.o)

SERVER		= server
CLIENT		= client
CC			= cc
CFLAGS		= -Wall -Wextra -Werror
RM			= rm -f

all:		$(SERVER) $(CLIENT)

$(SERVER): 	$(OBJ) $(LIBFT)
		@$(CC) $(LIBFT) server.o -o $(SERVER)
		@echo $(GREEN)"\n============================================================\n" $(EOC)
		@echo $(YELLOW)"                       SERVER DONE                          " $(EOC)
		@echo $(GREEN)"\n============================================================\n" $(EOC)

$(CLIENT): 	$(OBJ) $(LIBFT)
		@$(CC) $(CFLAGS) $(LIBFT) client.o -o $(CLIENT)
		@echo $(GREEN)"\n============================================================\n" $(EOC)
		@echo $(YELLOW)"                       CLIENT DONE                          " $(EOC)
		@echo $(GREEN)"\n============================================================\n" $(EOC)

$(LIBFT):
		@make --no-print-directory -C ./libft

%.o: 		%.c
		@$(CC) $(CFLAGS) -c $< -o $@

clean:
		@$(RM) $(OBJ)
		@echo $(GREEN)"\n============================================================\n" $(EOC)
		@echo $(YELLOW)"                          CLEAN                             " $(EOC)
		@echo $(GREEN)"\n============================================================\n" $(EOC)

fclean:		clean
		@$(RM) $(SERVER) $(CLIENT)
		@echo $(GREEN)"\n============================================================\n" $(EOC)
		@echo $(YELLOW)"                          FCLEAN                            " $(EOC)
		@echo $(GREEN)"\n============================================================\n" $(EOC)

re:			fclean all

.PHONY:		clean fclean re
