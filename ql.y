%{

//TODO Put your favorite license here
		
// yacc source generated by ebnf2y[1]
// at 2014-04-01 14:59:14.095609684 +0200 CEST
//
//  $ ebnf2y -o ql.y -oe ql.ebnf -start StatementList -pkg ql -p _
//
// CAUTION: If this file is a Go source file (*.go), it was generated
// automatically by '$ go tool yacc' from a *.y file - DO NOT EDIT in that case!
// 
//   [1]: http://github.com/cznic/ebnf2y

package ql //TODO real package name

//TODO required only be the demo _dump function
import (
	"bytes"
	"fmt"
	"strings"

	"github.com/cznic/strutil"
)

%}

%union {
	item interface{} //TODO insert real field(s)
}

%token	_ANDAND
%token	_ANDNOT
%token	_EQ
%token	_FLOAT_LIT
%token	_GE
%token	_IDENTIFIER
%token	_IMAGINARY_LIT
%token	_INT_LIT
%token	_LE
%token	_LSH
%token	_NEQ
%token	_OROR
%token	_QL_PARAMETER
%token	_RSH
%token	_RUNE_LIT
%token	_STRING_LIT

%type	<item> 	/*TODO real type(s), if/where applicable */
	_ANDAND
	_ANDNOT
	_EQ
	_FLOAT_LIT
	_GE
	_IDENTIFIER
	_IMAGINARY_LIT
	_INT_LIT
	_LE
	_LSH
	_NEQ
	_OROR
	_QL_PARAMETER
	_RSH
	_RUNE_LIT
	_STRING_LIT

%token _ADD
%token _ALTER
%token _AND
%token _AS
%token _ASC
%token _BEGIN
%token _BETWEEN
%token _BIGINT
%token _BIGRAT
%token _BLOB
%token _BOOL
%token _BY
%token _BYTE
%token _COLUMN
%token _COMMIT
%token _COMPLEX128
%token _COMPLEX64
%token _CREATE
%token _DELETE
%token _DESC
%token _DISTINCT
%token _DROP
%token _DURATION
%token _EXISTS
%token _FALSE
%token _FLOAT
%token _FLOAT32
%token _FLOAT64
%token _FROM
%token _GROUPBY
%token _ID
%token _IF
%token _IN
%token _INDEX
%token _INSERT
%token _INT
%token _INT16
%token _INT32
%token _INT64
%token _INT8
%token _INTO
%token _IS
%token _NOT
%token _NULL
%token _ON
%token _ORDER
%token _ROLLBACK
%token _RUNE
%token _SELECT
%token _STRING
%token _TABLE
%token _TIME
%token _TRANSACTION
%token _TRUE
%token _TRUNCATE
%token _UINT
%token _UINT16
%token _UINT32
%token _UINT64
%token _UINT8
%token _UPDATE
%token _VALUES
%token _WHERE

%type	<item> 	/*TODO real type(s), if/where applicable */
	AlterTableStmt
	AlterTableStmt1
	Assignment
	AssignmentList
	AssignmentList1
	AssignmentList2
	BeginTransactionStmt
	Call
	Call1
	ColumnDef
	ColumnName
	ColumnNameList
	ColumnNameList1
	ColumnNameList2
	CommitStmt
	Conversion
	CreateIndexStmt
	CreateIndexStmt1
	CreateTableStmt
	CreateTableStmt1
	CreateTableStmt2
	CreateTableStmt3
	DeleteFromStmt
	DeleteFromStmt1
	DropIndexStmt
	DropTableStmt
	DropTableStmt1
	EmptyStmt
	Expression
	Expression1
	ExpressionList
	ExpressionList1
	ExpressionList2
	Factor
	Factor1
	Factor11
	Factor2
	Field
	Field1
	FieldList
	FieldList1
	FieldList2
	GroupByClause
	Index
	IndexName
	InsertIntoStmt
	InsertIntoStmt1
	InsertIntoStmt2
	Literal
	Operand
	OrderBy
	OrderBy1
	OrderBy11
	Predicate
	Predicate1
	Predicate11
	Predicate12
	Predicate13
	PrimaryExpression
	PrimaryFactor
	PrimaryFactor1
	PrimaryFactor11
	PrimaryTerm
	PrimaryTerm1
	PrimaryTerm11
	QualifiedIdent
	QualifiedIdent1
	RecordSet
	RecordSet1
	RecordSet11
	RecordSet2
	RecordSetList
	RecordSetList1
	RecordSetList2
	RollbackStmt
	SelectStmt
	SelectStmt1
	SelectStmt2
	SelectStmt3
	SelectStmt4
	SelectStmt5
	Slice
	Slice1
	Slice2
	Start
	Statement
	StatementList
	StatementList1
	TableName
	Term
	Term1
	TruncateTableStmt
	Type
	UnaryExpr
	UnaryExpr1
	UnaryExpr11
	UpdateStmt
	UpdateStmt1
	Values
	Values1
	Values2
	WhereClause

/*TODO %left, %right, ... declarations */

%start Start

%%

AlterTableStmt:
	_ALTER _TABLE TableName AlterTableStmt1
	{
		$$ = []AlterTableStmt{"ALTER", "TABLE", $3, $4} //TODO 1
	}

AlterTableStmt1:
	_ADD ColumnDef
	{
		$$ = []AlterTableStmt1{"ADD", $2} //TODO 2
	}
|	_DROP _COLUMN ColumnName
	{
		$$ = []AlterTableStmt1{"DROP", "COLUMN", $3} //TODO 3
	}

Assignment:
	ColumnName '=' Expression
	{
		$$ = []Assignment{$1, "=", $3} //TODO 4
	}

AssignmentList:
	Assignment AssignmentList1 AssignmentList2
	{
		$$ = []AssignmentList{$1, $2, $3} //TODO 5
	}

AssignmentList1:
	/* EMPTY */
	{
		$$ = []AssignmentList1(nil) //TODO 6
	}
|	AssignmentList1 ',' Assignment
	{
		$$ = append($1.([]AssignmentList1), ",", $3) //TODO 7
	}

AssignmentList2:
	/* EMPTY */
	{
		$$ = nil //TODO 8
	}
|	','
	{
		$$ = "," //TODO 9
	}

BeginTransactionStmt:
	_BEGIN _TRANSACTION
	{
		$$ = []BeginTransactionStmt{"BEGIN", "TRANSACTION"} //TODO 10
	}

Call:
	'(' Call1 ')'
	{
		$$ = []Call{"(", $2, ")"} //TODO 11
	}

Call1:
	/* EMPTY */
	{
		$$ = nil //TODO 12
	}
|	ExpressionList
	{
		$$ = $1 //TODO 13
	}

ColumnDef:
	ColumnName Type
	{
		$$ = []ColumnDef{$1, $2} //TODO 14
	}

ColumnName:
	_IDENTIFIER
	{
		$$ = $1 //TODO 15
	}

ColumnNameList:
	ColumnName ColumnNameList1 ColumnNameList2
	{
		$$ = []ColumnNameList{$1, $2, $3} //TODO 16
	}

ColumnNameList1:
	/* EMPTY */
	{
		$$ = []ColumnNameList1(nil) //TODO 17
	}
|	ColumnNameList1 ',' ColumnName
	{
		$$ = append($1.([]ColumnNameList1), ",", $3) //TODO 18
	}

ColumnNameList2:
	/* EMPTY */
	{
		$$ = nil //TODO 19
	}
|	','
	{
		$$ = "," //TODO 20
	}

CommitStmt:
	_COMMIT
	{
		$$ = "COMMIT" //TODO 21
	}

Conversion:
	Type '(' Expression ')'
	{
		$$ = []Conversion{$1, "(", $3, ")"} //TODO 22
	}

CreateIndexStmt:
	_CREATE _INDEX IndexName _ON TableName '(' CreateIndexStmt1 ')'
	{
		$$ = []CreateIndexStmt{"CREATE", "INDEX", $3, "ON", $5, "(", $7, ")"} //TODO 23
	}

CreateIndexStmt1:
	ColumnName
	{
		$$ = $1 //TODO 24
	}
|	_ID Call
	{
		$$ = []CreateIndexStmt1{"id", $2} //TODO 25
	}

CreateTableStmt:
	_CREATE _TABLE CreateTableStmt1 TableName '(' ColumnDef CreateTableStmt2 CreateTableStmt3 ')'
	{
		$$ = []CreateTableStmt{"CREATE", "TABLE", $3, $4, "(", $6, $7, $8, ")"} //TODO 26
	}

CreateTableStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 27
	}
|	_IF _NOT _EXISTS
	{
		$$ = []CreateTableStmt1{"IF", "NOT", "EXISTS"} //TODO 28
	}

CreateTableStmt2:
	/* EMPTY */
	{
		$$ = []CreateTableStmt2(nil) //TODO 29
	}
|	CreateTableStmt2 ',' ColumnDef
	{
		$$ = append($1.([]CreateTableStmt2), ",", $3) //TODO 30
	}

CreateTableStmt3:
	/* EMPTY */
	{
		$$ = nil //TODO 31
	}
|	','
	{
		$$ = "," //TODO 32
	}

DeleteFromStmt:
	_DELETE _FROM TableName DeleteFromStmt1
	{
		$$ = []DeleteFromStmt{"DELETE", "FROM", $3, $4} //TODO 33
	}

DeleteFromStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 34
	}
|	WhereClause
	{
		$$ = $1 //TODO 35
	}

DropIndexStmt:
	_DROP _INDEX IndexName
	{
		$$ = []DropIndexStmt{"DROP", "INDEX", $3} //TODO 36
	}

DropTableStmt:
	_DROP _TABLE DropTableStmt1 TableName
	{
		$$ = []DropTableStmt{"DROP", "TABLE", $3, $4} //TODO 37
	}

DropTableStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 38
	}
|	_IF _EXISTS
	{
		$$ = []DropTableStmt1{"IF", "EXISTS"} //TODO 39
	}

EmptyStmt:
	/* EMPTY */
	{
		$$ = nil //TODO 40
	}

Expression:
	Term Expression1
	{
		$$ = []Expression{$1, $2} //TODO 41
	}

Expression1:
	/* EMPTY */
	{
		$$ = []Expression1(nil) //TODO 42
	}
|	Expression1 _OROR Term
	{
		$$ = append($1.([]Expression1), $2, $3) //TODO 43
	}

ExpressionList:
	Expression ExpressionList1 ExpressionList2
	{
		$$ = []ExpressionList{$1, $2, $3} //TODO 44
	}

ExpressionList1:
	/* EMPTY */
	{
		$$ = []ExpressionList1(nil) //TODO 45
	}
|	ExpressionList1 ',' Expression
	{
		$$ = append($1.([]ExpressionList1), ",", $3) //TODO 46
	}

ExpressionList2:
	/* EMPTY */
	{
		$$ = nil //TODO 47
	}
|	','
	{
		$$ = "," //TODO 48
	}

Factor:
	PrimaryFactor Factor1 Factor2
	{
		$$ = []Factor{$1, $2, $3} //TODO 49
	}

Factor1:
	/* EMPTY */
	{
		$$ = []Factor1(nil) //TODO 50
	}
|	Factor1 Factor11 PrimaryFactor
	{
		$$ = append($1.([]Factor1), $2, $3) //TODO 51
	}

Factor11:
	_GE
	{
		$$ = $1 //TODO 52
	}
|	'>'
	{
		$$ = ">" //TODO 53
	}
|	_LE
	{
		$$ = $1 //TODO 54
	}
|	'<'
	{
		$$ = "<" //TODO 55
	}
|	_NEQ
	{
		$$ = $1 //TODO 56
	}
|	_EQ
	{
		$$ = $1 //TODO 57
	}

Factor2:
	/* EMPTY */
	{
		$$ = nil //TODO 58
	}
|	Predicate
	{
		$$ = $1 //TODO 59
	}

Field:
	Expression Field1
	{
		$$ = []Field{$1, $2} //TODO 60
	}

Field1:
	/* EMPTY */
	{
		$$ = nil //TODO 61
	}
|	_AS _IDENTIFIER
	{
		$$ = []Field1{"AS", $2} //TODO 62
	}

FieldList:
	Field FieldList1 FieldList2
	{
		$$ = []FieldList{$1, $2, $3} //TODO 63
	}

FieldList1:
	/* EMPTY */
	{
		$$ = []FieldList1(nil) //TODO 64
	}
|	FieldList1 ',' Field
	{
		$$ = append($1.([]FieldList1), ",", $3) //TODO 65
	}

FieldList2:
	/* EMPTY */
	{
		$$ = nil //TODO 66
	}
|	','
	{
		$$ = "," //TODO 67
	}

GroupByClause:
	_GROUPBY ColumnNameList
	{
		$$ = []GroupByClause{"GROUP BY", $2} //TODO 68
	}

Index:
	'[' Expression ']'
	{
		$$ = []Index{"[", $2, "]"} //TODO 69
	}

IndexName:
	_IDENTIFIER
	{
		$$ = $1 //TODO 70
	}

InsertIntoStmt:
	_INSERT _INTO TableName InsertIntoStmt1 InsertIntoStmt2
	{
		$$ = []InsertIntoStmt{"INSERT", "INTO", $3, $4, $5} //TODO 71
	}

InsertIntoStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 72
	}
|	'(' ColumnNameList ')'
	{
		$$ = []InsertIntoStmt1{"(", $2, ")"} //TODO 73
	}

InsertIntoStmt2:
	Values
	{
		$$ = $1 //TODO 74
	}
|	SelectStmt
	{
		$$ = $1 //TODO 75
	}

Literal:
	_FALSE
	{
		$$ = "FALSE" //TODO 76
	}
|	_NULL
	{
		$$ = "NULL" //TODO 77
	}
|	_TRUE
	{
		$$ = "TRUE" //TODO 78
	}
|	_FLOAT_LIT
	{
		$$ = $1 //TODO 79
	}
|	_IMAGINARY_LIT
	{
		$$ = $1 //TODO 80
	}
|	_INT_LIT
	{
		$$ = $1 //TODO 81
	}
|	_RUNE_LIT
	{
		$$ = $1 //TODO 82
	}
|	_STRING_LIT
	{
		$$ = $1 //TODO 83
	}
|	_QL_PARAMETER
	{
		$$ = $1 //TODO 84
	}

Operand:
	Literal
	{
		$$ = $1 //TODO 85
	}
|	QualifiedIdent
	{
		$$ = $1 //TODO 86
	}
|	'(' Expression ')'
	{
		$$ = []Operand{"(", $2, ")"} //TODO 87
	}

OrderBy:
	_ORDER _BY ExpressionList OrderBy1
	{
		$$ = []OrderBy{"ORDER", "BY", $3, $4} //TODO 88
	}

OrderBy1:
	/* EMPTY */
	{
		$$ = nil //TODO 89
	}
|	OrderBy11
	{
		$$ = $1 //TODO 90
	}

OrderBy11:
	_ASC
	{
		$$ = "ASC" //TODO 91
	}
|	_DESC
	{
		$$ = "DESC" //TODO 92
	}

Predicate:
	Predicate1
	{
		$$ = $1 //TODO 93
	}

Predicate1:
	Predicate11 Predicate12 _IS Predicate13 _NULL
	{
		$$ = []Predicate1{$1, $2, "IS", $4, "NULL"} //TODO 94
	}

Predicate11:
	/* EMPTY */
	{
		$$ = nil //TODO 95
	}
|	_NOT
	{
		$$ = "NOT" //TODO 96
	}

Predicate12:
	_IN '(' ExpressionList ')'
	{
		$$ = []Predicate12{"IN", "(", $3, ")"} //TODO 97
	}
|	_BETWEEN PrimaryFactor _AND PrimaryFactor
	{
		$$ = []Predicate12{"BETWEEN", $2, "AND", $4} //TODO 98
	}

Predicate13:
	/* EMPTY */
	{
		$$ = nil //TODO 99
	}
|	_NOT
	{
		$$ = "NOT" //TODO 100
	}

PrimaryExpression:
	Operand
	{
		$$ = $1 //TODO 101
	}
|	Conversion
	{
		$$ = $1 //TODO 102
	}
|	PrimaryExpression Index
	{
		$$ = []PrimaryExpression{$1, $2} //TODO 103
	}
|	PrimaryExpression Slice
	{
		$$ = []PrimaryExpression{$1, $2} //TODO 104
	}
|	PrimaryExpression Call
	{
		$$ = []PrimaryExpression{$1, $2} //TODO 105
	}

PrimaryFactor:
	PrimaryTerm PrimaryFactor1
	{
		$$ = []PrimaryFactor{$1, $2} //TODO 106
	}

PrimaryFactor1:
	/* EMPTY */
	{
		$$ = []PrimaryFactor1(nil) //TODO 107
	}
|	PrimaryFactor1 PrimaryFactor11 PrimaryTerm
	{
		$$ = append($1.([]PrimaryFactor1), $2, $3) //TODO 108
	}

PrimaryFactor11:
	'^'
	{
		$$ = "^" //TODO 109
	}
|	'|'
	{
		$$ = "|" //TODO 110
	}
|	'-'
	{
		$$ = "-" //TODO 111
	}
|	'+'
	{
		$$ = "+" //TODO 112
	}

PrimaryTerm:
	UnaryExpr PrimaryTerm1
	{
		$$ = []PrimaryTerm{$1, $2} //TODO 113
	}

PrimaryTerm1:
	/* EMPTY */
	{
		$$ = []PrimaryTerm1(nil) //TODO 114
	}
|	PrimaryTerm1 PrimaryTerm11 UnaryExpr
	{
		$$ = append($1.([]PrimaryTerm1), $2, $3) //TODO 115
	}

PrimaryTerm11:
	_ANDNOT
	{
		$$ = $1 //TODO 116
	}
|	'&'
	{
		$$ = "&" //TODO 117
	}
|	_LSH
	{
		$$ = $1 //TODO 118
	}
|	_RSH
	{
		$$ = $1 //TODO 119
	}
|	'%'
	{
		$$ = "%" //TODO 120
	}
|	'/'
	{
		$$ = "/" //TODO 121
	}
|	'*'
	{
		$$ = "*" //TODO 122
	}

QualifiedIdent:
	_IDENTIFIER QualifiedIdent1
	{
		$$ = []QualifiedIdent{$1, $2} //TODO 123
	}

QualifiedIdent1:
	/* EMPTY */
	{
		$$ = nil //TODO 124
	}
|	'.' _IDENTIFIER
	{
		$$ = []QualifiedIdent1{".", $2} //TODO 125
	}

RecordSet:
	RecordSet1 RecordSet2
	{
		$$ = []RecordSet{$1, $2} //TODO 126
	}

RecordSet1:
	TableName
	{
		$$ = $1 //TODO 127
	}
|	'(' SelectStmt RecordSet11 ')'
	{
		$$ = []RecordSet1{"(", $2, $3, ")"} //TODO 128
	}

RecordSet11:
	/* EMPTY */
	{
		$$ = nil //TODO 129
	}
|	';'
	{
		$$ = ";" //TODO 130
	}

RecordSet2:
	/* EMPTY */
	{
		$$ = nil //TODO 131
	}
|	_AS _IDENTIFIER
	{
		$$ = []RecordSet2{"AS", $2} //TODO 132
	}

RecordSetList:
	RecordSet RecordSetList1 RecordSetList2
	{
		$$ = []RecordSetList{$1, $2, $3} //TODO 133
	}

RecordSetList1:
	/* EMPTY */
	{
		$$ = []RecordSetList1(nil) //TODO 134
	}
|	RecordSetList1 ',' RecordSet
	{
		$$ = append($1.([]RecordSetList1), ",", $3) //TODO 135
	}

RecordSetList2:
	/* EMPTY */
	{
		$$ = nil //TODO 136
	}
|	','
	{
		$$ = "," //TODO 137
	}

RollbackStmt:
	_ROLLBACK
	{
		$$ = "ROLLBACK" //TODO 138
	}

SelectStmt:
	_SELECT SelectStmt1 SelectStmt2 _FROM RecordSetList SelectStmt3 SelectStmt4 SelectStmt5
	{
		$$ = []SelectStmt{"SELECT", $2, $3, "FROM", $5, $6, $7, $8} //TODO 139
	}

SelectStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 140
	}
|	_DISTINCT
	{
		$$ = "DISTINCT" //TODO 141
	}

SelectStmt2:
	'*'
	{
		$$ = "*" //TODO 142
	}
|	FieldList
	{
		$$ = $1 //TODO 143
	}

SelectStmt3:
	/* EMPTY */
	{
		$$ = nil //TODO 144
	}
|	WhereClause
	{
		$$ = $1 //TODO 145
	}

SelectStmt4:
	/* EMPTY */
	{
		$$ = nil //TODO 146
	}
|	GroupByClause
	{
		$$ = $1 //TODO 147
	}

SelectStmt5:
	/* EMPTY */
	{
		$$ = nil //TODO 148
	}
|	OrderBy
	{
		$$ = $1 //TODO 149
	}

Slice:
	'[' Slice1 ':' Slice2 ']'
	{
		$$ = []Slice{"[", $2, ":", $4, "]"} //TODO 150
	}

Slice1:
	/* EMPTY */
	{
		$$ = nil //TODO 151
	}
|	Expression
	{
		$$ = $1 //TODO 152
	}

Slice2:
	/* EMPTY */
	{
		$$ = nil //TODO 153
	}
|	Expression
	{
		$$ = $1 //TODO 154
	}

Start:
	StatementList
	{
		_parserResult = $1 //TODO 155
	}

Statement:
	EmptyStmt
	{
		$$ = $1 //TODO 156
	}
|	AlterTableStmt
	{
		$$ = $1 //TODO 157
	}
|	BeginTransactionStmt
	{
		$$ = $1 //TODO 158
	}
|	CommitStmt
	{
		$$ = $1 //TODO 159
	}
|	CreateIndexStmt
	{
		$$ = $1 //TODO 160
	}
|	CreateTableStmt
	{
		$$ = $1 //TODO 161
	}
|	DeleteFromStmt
	{
		$$ = $1 //TODO 162
	}
|	DropIndexStmt
	{
		$$ = $1 //TODO 163
	}
|	DropTableStmt
	{
		$$ = $1 //TODO 164
	}
|	InsertIntoStmt
	{
		$$ = $1 //TODO 165
	}
|	RollbackStmt
	{
		$$ = $1 //TODO 166
	}
|	SelectStmt
	{
		$$ = $1 //TODO 167
	}
|	TruncateTableStmt
	{
		$$ = $1 //TODO 168
	}
|	UpdateStmt
	{
		$$ = $1 //TODO 169
	}

StatementList:
	Statement StatementList1
	{
		$$ = []StatementList{$1, $2} //TODO 170
	}

StatementList1:
	/* EMPTY */
	{
		$$ = []StatementList1(nil) //TODO 171
	}
|	StatementList1 ';' Statement
	{
		$$ = append($1.([]StatementList1), ";", $3) //TODO 172
	}

TableName:
	_IDENTIFIER
	{
		$$ = $1 //TODO 173
	}

Term:
	Factor Term1
	{
		$$ = []Term{$1, $2} //TODO 174
	}

Term1:
	/* EMPTY */
	{
		$$ = []Term1(nil) //TODO 175
	}
|	Term1 _ANDAND Factor
	{
		$$ = append($1.([]Term1), $2, $3) //TODO 176
	}

TruncateTableStmt:
	_TRUNCATE _TABLE TableName
	{
		$$ = []TruncateTableStmt{"TRUNCATE", "TABLE", $3} //TODO 177
	}

Type:
	_BIGINT
	{
		$$ = "bigint" //TODO 178
	}
|	_BIGRAT
	{
		$$ = "bigrat" //TODO 179
	}
|	_BLOB
	{
		$$ = "blob" //TODO 180
	}
|	_BOOL
	{
		$$ = "bool" //TODO 181
	}
|	_BYTE
	{
		$$ = "byte" //TODO 182
	}
|	_COMPLEX128
	{
		$$ = "complex128" //TODO 183
	}
|	_COMPLEX64
	{
		$$ = "complex64" //TODO 184
	}
|	_DURATION
	{
		$$ = "duration" //TODO 185
	}
|	_FLOAT
	{
		$$ = "float" //TODO 186
	}
|	_FLOAT32
	{
		$$ = "float32" //TODO 187
	}
|	_FLOAT64
	{
		$$ = "float64" //TODO 188
	}
|	_INT
	{
		$$ = "int" //TODO 189
	}
|	_INT16
	{
		$$ = "int16" //TODO 190
	}
|	_INT32
	{
		$$ = "int32" //TODO 191
	}
|	_INT64
	{
		$$ = "int64" //TODO 192
	}
|	_INT8
	{
		$$ = "int8" //TODO 193
	}
|	_RUNE
	{
		$$ = "rune" //TODO 194
	}
|	_STRING
	{
		$$ = "string" //TODO 195
	}
|	_TIME
	{
		$$ = "time" //TODO 196
	}
|	_UINT
	{
		$$ = "uint" //TODO 197
	}
|	_UINT16
	{
		$$ = "uint16" //TODO 198
	}
|	_UINT32
	{
		$$ = "uint32" //TODO 199
	}
|	_UINT64
	{
		$$ = "uint64" //TODO 200
	}
|	_UINT8
	{
		$$ = "uint8" //TODO 201
	}

UnaryExpr:
	UnaryExpr1 PrimaryExpression
	{
		$$ = []UnaryExpr{$1, $2} //TODO 202
	}

UnaryExpr1:
	/* EMPTY */
	{
		$$ = nil //TODO 203
	}
|	UnaryExpr11
	{
		$$ = $1 //TODO 204
	}

UnaryExpr11:
	'^'
	{
		$$ = "^" //TODO 205
	}
|	'!'
	{
		$$ = "!" //TODO 206
	}
|	'-'
	{
		$$ = "-" //TODO 207
	}
|	'+'
	{
		$$ = "+" //TODO 208
	}

UpdateStmt:
	_UPDATE TableName AssignmentList UpdateStmt1
	{
		$$ = []UpdateStmt{"UPDATE", $2, $3, $4} //TODO 209
	}

UpdateStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 210
	}
|	WhereClause
	{
		$$ = $1 //TODO 211
	}

Values:
	_VALUES '(' ExpressionList ')' Values1 Values2
	{
		$$ = []Values{"VALUES", "(", $3, ")", $5, $6} //TODO 212
	}

Values1:
	/* EMPTY */
	{
		$$ = []Values1(nil) //TODO 213
	}
|	Values1 ',' '(' ExpressionList ')'
	{
		$$ = append($1.([]Values1), ",", "(", $4, ")") //TODO 214
	}

Values2:
	/* EMPTY */
	{
		$$ = nil //TODO 215
	}
|	','
	{
		$$ = "," //TODO 216
	}

WhereClause:
	_WHERE Expression
	{
		$$ = []WhereClause{"WHERE", $2} //TODO 217
	}

%%

//TODO remove demo stuff below

var _parserResult interface{}

type (
	AlterTableStmt interface{}
	AlterTableStmt1 interface{}
	Assignment interface{}
	AssignmentList interface{}
	AssignmentList1 interface{}
	AssignmentList2 interface{}
	BeginTransactionStmt interface{}
	Call interface{}
	Call1 interface{}
	ColumnDef interface{}
	ColumnName interface{}
	ColumnNameList interface{}
	ColumnNameList1 interface{}
	ColumnNameList2 interface{}
	CommitStmt interface{}
	Conversion interface{}
	CreateIndexStmt interface{}
	CreateIndexStmt1 interface{}
	CreateTableStmt interface{}
	CreateTableStmt1 interface{}
	CreateTableStmt2 interface{}
	CreateTableStmt3 interface{}
	DeleteFromStmt interface{}
	DeleteFromStmt1 interface{}
	DropIndexStmt interface{}
	DropTableStmt interface{}
	DropTableStmt1 interface{}
	EmptyStmt interface{}
	Expression interface{}
	Expression1 interface{}
	ExpressionList interface{}
	ExpressionList1 interface{}
	ExpressionList2 interface{}
	Factor interface{}
	Factor1 interface{}
	Factor11 interface{}
	Factor2 interface{}
	Field interface{}
	Field1 interface{}
	FieldList interface{}
	FieldList1 interface{}
	FieldList2 interface{}
	GroupByClause interface{}
	Index interface{}
	IndexName interface{}
	InsertIntoStmt interface{}
	InsertIntoStmt1 interface{}
	InsertIntoStmt2 interface{}
	Literal interface{}
	Operand interface{}
	OrderBy interface{}
	OrderBy1 interface{}
	OrderBy11 interface{}
	Predicate interface{}
	Predicate1 interface{}
	Predicate11 interface{}
	Predicate12 interface{}
	Predicate13 interface{}
	PrimaryExpression interface{}
	PrimaryFactor interface{}
	PrimaryFactor1 interface{}
	PrimaryFactor11 interface{}
	PrimaryTerm interface{}
	PrimaryTerm1 interface{}
	PrimaryTerm11 interface{}
	QualifiedIdent interface{}
	QualifiedIdent1 interface{}
	RecordSet interface{}
	RecordSet1 interface{}
	RecordSet11 interface{}
	RecordSet2 interface{}
	RecordSetList interface{}
	RecordSetList1 interface{}
	RecordSetList2 interface{}
	RollbackStmt interface{}
	SelectStmt interface{}
	SelectStmt1 interface{}
	SelectStmt2 interface{}
	SelectStmt3 interface{}
	SelectStmt4 interface{}
	SelectStmt5 interface{}
	Slice interface{}
	Slice1 interface{}
	Slice2 interface{}
	Start interface{}
	Statement interface{}
	StatementList interface{}
	StatementList1 interface{}
	TableName interface{}
	Term interface{}
	Term1 interface{}
	TruncateTableStmt interface{}
	Type interface{}
	UnaryExpr interface{}
	UnaryExpr1 interface{}
	UnaryExpr11 interface{}
	UpdateStmt interface{}
	UpdateStmt1 interface{}
	Values interface{}
	Values1 interface{}
	Values2 interface{}
	WhereClause interface{}
)
	
func _dump() {
	s := fmt.Sprintf("%#v", _parserResult)
	s = strings.Replace(s, "%", "%%", -1)
	s = strings.Replace(s, "{", "{%i\n", -1)
	s = strings.Replace(s, "}", "%u\n}", -1)
	s = strings.Replace(s, ", ", ",\n", -1)
	var buf bytes.Buffer
	strutil.IndentFormatter(&buf, ". ").Format(s)
	buf.WriteString("\n")
	a := strings.Split(buf.String(), "\n")
	for _, v := range a {
		if strings.HasSuffix(v, "(nil)") || strings.HasSuffix(v, "(nil),") {
			continue
		}
	
		fmt.Println(v)
	}
}

// End of demo stuff
