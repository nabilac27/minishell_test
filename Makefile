# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nchairun <nchairun@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/15 20:36:40 by nchairun          #+#    #+#              #
#    Updated: 2025/03/15 20:36:59 by nchairun         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= minishell

LIBFT_DIR	= ./include/lib
LIBFT 		= $(LIBFT_DIR)/libft.a

SRCS		= $(shell find ./src -iname "*.c")
OBJS		= $(SRCS:./src/%.c=./build/%.o)

CC		= cc
CFLAGS		= -Wall -Wextra -Werror -g

.SILENT:

all: $(NAME)

$(NAME): $(OBJS)
	make -C $(LIBFT_DIR)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIBFT)

./build/%.o: ./src/%.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(LIBFT_DIR)/build/libft/*.o
    
fclean: clean
	rm -f $(NAME)
	rm -f $(LIBFT)
    
re: fclean all

.PHONY: all fclean clean re
