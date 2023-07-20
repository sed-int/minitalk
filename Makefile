# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcho2 <hcho2@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/19 13:40:03 by hcho2             #+#    #+#              #
#    Updated: 2023/07/20 13:13:15 by hcho2            ###   ########.fr        #
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
BSRC		= server_bonus.c client_bonus.c

OBJ			= $(SRC:.c=.o)
BOBJ		= $(BSRC:.c=.o)

SERVER		= server
CLIENT		= client
B_SERVER	= bserver
B_CLIENT	= bclient
CC			= cc
CFLAGS		= -Wall -Wextra -Werror
RM			= rm -f

all:		$(SERVER) $(CLIENT)

$(SERVER): 	$(OBJ) $(LIBFT)
		@$(CC) $(LIBFT) server.o -o $(SERVER)
		@echo $(GREEN)"server made." $(EOC)

$(CLIENT): 	$(OBJ) $(LIBFT)
		@$(CC) $(LIBFT) client.o -o $(CLIENT)
		@echo $(GREEN)"client made." $(EOC)


bonus: $(B_SERVER) $(B_CLIENT)

$(B_SERVER): 	$(BOBJ) $(LIBFT)
		@$(CC) $(LIBFT) server_bonus.o -o server
		@touch $@
		@echo $(GREEN)"bonus server made." $(EOC)

$(B_CLIENT): 	$(BOBJ) $(LIBFT)
		@$(CC) $(LIBFT) client_bonus.o -o client
		@touch $@
		@echo $(GREEN)"bonus client made." $(EOC)


$(LIBFT):
		@make --no-print-directory -C ./libft

%.o: 		%.c
		@$(CC) $(CFLAGS) -c $< -o $@

clean:
		@cd libft; make clean
		@$(RM) $(OBJ) $(BOBJ)
		@echo $(GREEN)"cleaned." $(EOC)

fclean:		clean
		@cd libft; make fclean
		@$(RM) $(SERVER) $(CLIENT) $(B_SERVER) $(B_CLIENT)
		@echo $(GREEN)"fcleaned." $(EOC)

re:			fclean all

.PHONY:		clean fclean re
