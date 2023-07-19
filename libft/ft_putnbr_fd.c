/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hcho2 <hcho2@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/16 10:16:01 by hcho2             #+#    #+#             */
/*   Updated: 2023/03/16 10:19:05 by hcho2            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

void	ft_putnbr_fd(int n, int fd)
{
	long long	lnb;
	char		s[20];
	int			i;

	i = -1;
	lnb = n;
	if (lnb == 0)
	{
		write(fd, "0", 1);
		return ;
	}
	if (lnb < 0)
	{
		write(fd, "-", 1);
		lnb *= -1;
	}
	while (lnb)
	{
		s[++i] = lnb % 10 + '0';
		lnb /= 10;
	}
	while (i >= 0)
		write(fd, &s[i--], 1);
}
