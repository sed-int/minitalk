/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hcho2 <hcho2@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/19 11:31:49 by hcho2             #+#    #+#             */
/*   Updated: 2023/07/19 20:25:18 by hcho2            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_putpid(void)
{
	pid_t	pid;

	pid = getpid();
	ft_putstr_fd("PID: ", 1);
	ft_putnbr_fd(pid, 1);
	write(1, "\n", 1);
}

void	ft_handler(int signal, siginfo_t *sig, void *tmp)
{
	static int	bit;
	static char	c;
	pid_t		pid;

	(void)tmp;
	if (signal == SIGUSR1)
		c |= (1 << bit);
	bit++;
	pid = sig->si_pid;
	if (bit == 8)
	{
		if (c != '\0')
			write(1, &c, 1);
		else
			kill(pid, SIGUSR1);
		bit = 0;
		c = 0;
	}
}

int	main(int ac, char **av)
{
	struct sigaction	sig;

	(void)av;
	if (ac != 1)
	{
		ft_putstr_fd("USAGE: ./server", 2);
		return (1);
	}
	ft_putpid();
	sig.sa_flags = SA_SIGINFO;
	sig.sa_sigaction = ft_handler;
	sigemptyset(&sig.sa_mask);
	sigaction(SIGUSR1, &sig, 0);
	sigaction(SIGUSR2, &sig, 0);
	while (1)
		pause();
}
