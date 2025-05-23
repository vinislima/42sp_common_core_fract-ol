# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vinda-si <vinda-si@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/21 21:28:16 by vinda-si          #+#    #+#              #
#    Updated: 2025/05/21 21:28:21 by vinda-si         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol
CC = cc
CFLAGS = -g -I/minilibx -Wall -Wextra -Werror
MLXFLAGS = -L./minilibx-linux -lmlx -lXext -lX11 -lm

MLX_DIR = minilibx-linux
MLX_LIB = $(MLX_DIR)/libmlx.a

SRC = \
	src/handlers.c \
	src/init.c \
	src/lib_utils.c \
	src/main.c \
	src/math.c \
	src/render.c \

OBJ = $(SRC:%.c=%.o)

all: $(NAME)

$(MLX_LIB):
		@$(MAKE) -C $(MLX_DIR)

$(NAME): $(OBJ) $(MLX_LIB)
		$(CC) $(CFLAGS) $(OBJ) $(MLXFLAGS) -o $(NAME)

clean:
		rm -f $(OBJ)

fclean: clean
		rm -f $(NAME)
		@$(MAKE) -C $(MLX_DIR) clean

re: fclean all

.PHONY: all clean fclean re