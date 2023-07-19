/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstsize.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hcho2 <hcho2@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/16 15:49:19 by hcho2             #+#    #+#             */
/*   Updated: 2023/03/17 12:54:59 by hcho2            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_lstsize(t_list *lst)
{
	t_list	*iter;
	int		size;

	if (!lst)
		return (0);
	iter = lst;
	size = 0;
	while (iter)
	{
		size++;
		iter = iter->next;
	}
	return (size);
}
