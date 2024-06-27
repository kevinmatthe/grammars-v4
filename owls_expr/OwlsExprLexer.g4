lexer grammar OwlsExprLexer;

options { caseInsensitive = true; }

// Reserved words
AND: 'AND';
OR: 'OR';
NOT: 'NOT';
NEAR: 'NEAR';

// Tokens
NUMBER: [0-9]+;

NAME: ('\\' . | ~[ "+-/:=()<>[\]])+;

STRING: '"' ( ~["\\\n\r] | '\\' .)* '"';

// Operators
PLUS: '+';
DIVIDE: '/';
MINUS: '-';

// Delimiters
LPAREN: '(';
RPAREN: ')';
LSQUARE: '[';
RSQUARE: ']';
LTSIGN: '<';
GTSIGN: '>';
EQUAL: '=';
COLON: ':';
NEAROP: '<near/' [0-9]+ '>';

// Whitespace
WS: [ \t\r\n]+ -> skip;