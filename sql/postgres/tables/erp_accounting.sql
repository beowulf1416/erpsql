/**
 * postgres
 * requires:
 * 	../erp.sql
 */

create table erp.accounts (
	id unsigned int not null,
	client_id unsigned int not null,
	name varchar(200) not null,
	code varchar(100) not null,
	active unsigned int not null default 1,
	create_ts datetime not null default current_date,
	constraint pk_accounts primary key (id),
	constraint u_accounts_1 unique key (client_id, name),
	constraint u_accounts_2 unique key (client_id, code),
	constraint fk_accounts_1 foreign key (client_id) references erp.clients (id) on delete restrict
);

comment on erp.accounts.id is 'account id';

create table erp.acct_balances (
	acct_id unsigned int not null,
	client_id unsigned int not null,
	balance decimal(12,4) not null default 0,
	constraint pk_acct_balances primary key (acct_id),
	constraint fk_acct_balances_1 foreign key (acct_id) references erp.accounts (id) on delete restrict,
	constraint fk_acct_balances_2 foreign key (client_id) references erp.clients (id) on delete restrict
);

create table erp.acct_balances_periodic (
	acct_id unsigned int not null,
	client_id unsigned int not null,
	balance decimal(12,4) not null,
	created_ts datetime not null default current_date,
	constraint pk_acct_balances_periodic primary key (acct_id, client_id, created_ts),
	constraint fk_acct_balances_periodic foreign key (acct_id) references erp.accounts (id) on delete restrict,
	constraint fk_acct_balances_periodic foreign key (client_id) references erp.clients (id) on delete restrict
);

create table erp.acct_tree (
	client_id unsigned int not null,
	parent_acct_id unsigned int not null,
	acct_id unsigned int not null,
	constraint pk_acct_tree primary key (client_id, acct_id, parent_acct_id),
	constraint fk_acct_tree_1 foreign key (client_id) references erp.clients (id) on delete restrict,
	constraint fk_acct_tree_2 foreign key (parent_acct_id) references erp.accounts(id) on delete restrict,
	constraint fk_acct_tree_3 foreign key (acct_id) references erp.accounts (id) on delete restrict
);

create sequence erp.acct_transactions_seq;

create table erp.transactions (
	id unsigned int not null default nextval('acct_transactions_seq'),
	client_id unsigned int not null,
	description text not null,
	active unsigned int not null default 1,
	created datetime not null default current_date,
	posted datetime,
	constraint pk_transactions primary key (id),
	constraint fk_transactions_1 foreign key (client_id) references erp.clients (id) on delete restrict
);

create table erp.transaction_accts (
	transaction_id unsigned int not null,
	client_id unsigned int not null,
	acct_id unsigned int not null,
	credit decimal(12,4) not null default 0,
	debit decimal(12,4) not null default 0,
	created datetime not null default current_date,
	posted datetime,
	constraint pk_transaction_accts primary key (transaction_id),
	constraint fk_transaction_accts_1 foreign key (transaction_id) references erp.transactions (id) on delete restrict,
	constraint fk_transaction_accts_2 foreign key (client_id) references erp.clients (id) on delete restrict,
	constraint fk_transaction_accts_3 foreign key (acct_id) references erp.accounts (id) on delete restrict
	constraint chk_transactions_1 check ( credit <> debit ) 
);