/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hcho2 <hcho2@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/19 11:30:49 by hcho2             #+#    #+#             */
/*   Updated: 2023/07/19 15:40:30 by hcho2            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_send_bits(pid_t pid, char c)
{
	int	bit;

	bit = -1;
	while (++bit < 8)
	{
		if (c & (1 << bit))
		{
			if (kill(pid, SIGUSR1) == -1)
			{
				ft_putstr_fd("Failed to send a signal.\n", 2);
				exit(1);
			}
		}
		else
		{
			if (kill(pid, SIGUSR2) == -1)
			{
				ft_putstr_fd("Failed to send a signal.\n", 2);
				exit(1);
			}
		}
		usleep(125);
	}
}

void	ft_send_msg(pid_t pid, char *msg)
{
	int	i;

	i = -1;
	while (msg[++i])
	{
		ft_send_bits(pid, msg[i]);
		usleep(50);
	}
	ft_send_bits(pid, '\n');
}

int	main(int ac, char **av)
{
	pid_t	pid;

	if (ac == 3 && av[2][0] != '\0')
	{
		pid = ft_atoi(av[1]);
		if (pid < 100 || pid > 99998)
		{
			ft_putstr_fd("Wrong pid.\n", 2);
			return (2);
		}
		ft_send_msg(pid, av[2]);
	}
	else
	{
		ft_putstr_fd("USAGE: ./client [PID] [MESSAGE]\n", 2);
		return (1);
	}
}
