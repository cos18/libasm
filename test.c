/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sunpark <sunpark@student.42seoul.kr>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/08 20:22:55 by sunpark           #+#    #+#             */
/*   Updated: 2020/11/10 17:37:02 by sunpark          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

void	test_complecated(void)
{
	int		fd;
	char	ft_makefile[10000];
	char	makefile[10000];
	char	*dup_makefile;
	char	*ft_dup_makefile;

	printf("Test with complecated examples!\n");
	if ((fd = open("Makefile", O_RDONLY)) == 0)
	{
		printf("Failed to open Makefile.\nTHIS ISN'T THE REASON LIBASM IS WRONG!!");
		return ;
	}
	read(fd, makefile, 10000);
	close(fd);
	if ((fd = open("Makefile", O_RDONLY)) == 0)
	{
		printf("Failed to open Makefile.\nTHIS ISN'T THE REASON LIBASM IS WRONG!!");
		return ;
	}
	ft_read(fd, ft_makefile, 10000);
	close(fd);
	printf("READ MAKEFILE!\n%s\n\n", makefile);
	printf("FT_READ MAKEFILE!\n%s\n\n", ft_makefile);
	printf("strcmp(makefile, ft_makefile) : %d strlen(ft_makefile) : %d\n",
			strcmp(makefile, ft_makefile), strlen(makefile));
	printf("ft_strcmp(makefile, ft_makefile) : %d ft_strlen(ft_makefile) : %d\n",
			ft_strcmp(makefile, ft_makefile), ft_strlen(ft_makefile));
	dup_makefile = strdup(makefile);
	ft_dup_makefile = strdup(ft_makefile);
	printf("strcmp(dup_makefile, ft_dup_makefile) : %d\n", strcmp(dup_makefile, ft_dup_makefile));
	printf("ft_strcmp(dup_makefile, ft_dup_makefile) : %d\n", ft_strcmp(dup_makefile, ft_dup_makefile));
	free(dup_makefile);
	free(ft_dup_makefile);
}

int		main(void)
{
	test_complecated();
}
