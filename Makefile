# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sunpark <sunpark@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/08 19:58:50 by sunpark           #+#    #+#              #
#    Updated: 2020/11/10 17:31:13 by sunpark          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS	= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS	= ${SRCS:.s=.o}

ASM		= nasm
ASFLAG	= -fmacho64
GCC		= gcc
GCCFLAG	= -Wall -Wextra -Werror -L. -lasm

NAME	= libasm.a
TNAME	= libasm_test

%.o: 		%.s
			${ASM} ${ASFLAG} $< -o $@

${NAME}:	${OBJS}
			ar rcs ${NAME} ${OBJS}

all:		${NAME}

test:		all
			${GCC} -o ${TNAME} test.c ${NAME}
			./${TNAME}

clean:
			rm -f ${OBJS}

fclean: 	clean
			rm -f ${NAME}

re: 		fclean all

.PHONY: 	all clean fclean re
