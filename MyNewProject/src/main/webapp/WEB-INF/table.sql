-- 관리자 계정 목록
-- rank는 관리자 등급, sal은 실적
create table admin_user(
	num number primary key,
	name varchar2(10) not null,
	email varchar2(20) not null,
	id varchar2(10) not null,
	pwd varchar2(20) not null,
	sal number not null,
	rank number not null,
	regdate date
);

create sequence admin_user_seq;
-- 일반 유저 목록
-- rank는 3이 우량, 2가 일반, 1이 악질
-- 이메일은 생략 가능
create table public_user(
	num number primary key,
	name varchar2(20) not null,
	email varchar2(20),
	id varchar2(10) not null,
	pwd varchar2(20) not null,
	rank number not null,
	regdate date
);

create sequence public_user_seq;
-- 리뷰의 대상이 되는 상점 목록
-- claim 횟수는 별도 기록. 많을수록 rank에 반영되는 비율이 떨어진다.
--(100 이하는 -x. 100 이상부터는 -0.5x, 500 이상부터는 -0.25x)
-- rank는 좋아요*2 - 싫어요 숫자로 적용
create table shop_user(
	num number primary key,
	name varchar2(50) not null,
	phone varchar2(20) not null,
	id varchar2(10) not null,
	pwd varchar2(20) not null,
	rank number not null,
	claim number not null
);

create sequence shop_user_seq;

-- review에 대한 테이블
-- viewcount는 관리자에 의한 조작이 가능
-- 삭제는 관리자만 가능
-- 내용 수정, 좋아요는 일반 유저만 가능
create table review(
	num number primary key,
	writer varchar2(50) not null,
	title varchar2(20) not null,
	content CLOB,
	viewcount number,
	likes number,
	regdate date
);

create sequence review_seq;