-- using 1433771997 as a seed to the RNG


select
	c.c_custkey,
	c.c_name,
--	sum(l_extendedprice * (1 - l_discount)) as revenue,
	c.c_acctbal,
	n.n_name,
	c.c_address,
	c.c_phone,
	c.c_comment
from
	customer as c,
	orders as o,
	lineitem as l,
	nation as n
where
	c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and o.o_orderdate >= date '1994-01-01'
	and o.o_orderdate < date '1994-01-01' + interval '3' month
	and l.l_returnflag = 'R'
	and c.c_nationkey = n.n_nationkey
group by
	c.c_custkey,
	c.c_name,
	c.c_acctbal,
	c.c_phone,
	n.n_name,
	c.c_address,
	c.c_comment
--order by
--	revenue desc
LIMIT 20;
