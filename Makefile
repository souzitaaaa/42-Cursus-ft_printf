# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dinoguei <dinoguei@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/28 15:13:33 by dinoguei          #+#    #+#              #
#    Updated: 2022/12/15 17:42:11 by dinoguei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

LIBFT = ./libft/libft.a
LIBFTDIR = ./libft

SRC = ./src

PRINTF_SRCS = ft_printf_utils.c \
				ft_printf_hex.c \
				ft_printf_pointer.c \
				ft_printf.c \

OBJS = $(PRINTF_SRCS:.c=.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror
AR = ar rc
RM = rm -rf
CP = cp

all: $(NAME)

$(NAME): $(LIBFT) $(OBJS)
	$(CP) $(LIBFT) $(NAME)
	$(AR) $(NAME) $(OBJS)

$(LIBFT): $(LIBFTDIR)
	@$(MAKE) -C $(LIBFTDIR)

clean:
	@$(MAKE) clean -C $(LIBFTDIR)
	$(RM) $(OBJS)

fclean: clean
	@$(MAKE) fclean -C $(LIBFTDIR)
	$(RM) $(NAME)

re: fclean all
