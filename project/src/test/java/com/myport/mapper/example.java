package com.myport.mapper;

import java.util.Iterator;
import java.util.Scanner;

import org.junit.Test;

public class example {

	@Test
	public void getGoodsListTest() {
		Scanner sc = new Scanner(System.in);
		
		int number = 0;
		int odd = 0;
		int even = 0;
		
		for (int i = 0; i < 5; i++) {
			System.out.println("���ڸ� �Է��ϼ���");
			number = sc.nextInt();
			
			if (number % 2 != 0) {
				odd = odd + number;
			}else
				even = even + number;
		}
		
		System.out.println("Ȧ���� " + odd);
		System.out.println("¦���� " + even);
	}
}
