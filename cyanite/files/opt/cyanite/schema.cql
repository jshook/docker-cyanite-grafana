CREATE KEYSPACE IF NOT EXISTS metric WITH replication = {
  'class': 'SimpleStrategy',
  'replication_factor': '1'
};

USE metric;

CREATE TABLE IF NOT EXISTS metric (
  period int,
  rollup int,
  tenant text,
  path text,
  time bigint,
  data list<double>,
  PRIMARY KEY ((tenant, period, rollup, path), time)
) WITH
  bloom_filter_fp_chance=0.010000 AND
  caching='KEYS_ONLY' AND
  comment='' AND
  dclocal_read_repair_chance=0.000000 AND
  gc_grace_seconds=86400 AND
  index_interval=128 AND
  read_repair_chance=0.000000 AND
  replicate_on_write='true' AND
  populate_io_cache_on_flush='false' AND
  default_time_to_live=0 AND
  speculative_retry='NONE' AND
  memtable_flush_period_in_ms=0 AND
  compaction={'class': 'DateTieredCompactionStrategy', 'max_sstable_age_days': 0.25, 'base_time_seconds':600, min_threshold:10 } AND
  compression={'sstable_compression': ''};
