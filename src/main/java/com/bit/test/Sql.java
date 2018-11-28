package com.bit.test;

public class Sql {
	public static void main(String[] args) {
		for(int i=1; i<102; i++) {
			System.out.println("INSERT INTO BBS VALUES('id',seq_bbs.NEXTVAL,'제목"+i+"','내용"+i+"',0,sysdate);"); 
		}
		System.out.println("insert into users values('id','pw','name');");
	}
}
