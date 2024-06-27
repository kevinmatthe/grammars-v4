parser grammar OwlsExprParser;

options {
	tokenVocab = OwlsExprLexer;
}

root: rule EOF;

rule: or_rule | or_rule nosuffix;

nosuffix: op = MINUS primary_rule | op = NOT primary_rule;

or_rule:
	or_rule op = DIVIDE and_rule
	| or_rule op = OR and_rule
	| and_rule;

and_rule:
	and_rule op = PLUS near_rule
	| and_rule op = AND near_rule
	| near_rule;

near_rule: near_rule op = near_op primary_rule | primary_rule;

near_op: NEAROP | NEAR DIVIDE NUMBER | NEAR;

primary_rule:
	base_value
	| concavalue
	| kv_rule
	| compare_rule
	| nested_rule
	| lop = LPAREN rule rop = RPAREN;

kv_rule: NAME COLON base_value | NAME COLON concavalue;

compare_rule:
	NAME LTSIGN NUMBER
	| NAME GTSIGN NUMBER
	| NAME EQUAL NUMBER
	| NAME LTSIGN EQUAL NUMBER
	| NAME GTSIGN EQUAL NUMBER;

nested_rule: NAME LSQUARE rule RSQUARE;

concavalue: NAME | NUMBER | concavalue concavalue;

base_value: STRING;

operator: AND | OR | NOT | NEAR;

delimiter: LPAREN | RPAREN | LSQUARE | RSQUARE;