context("vars")
f <- system.file("extdata", "S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "ncmeta")

test_that("vars works", {
  v <- nc_vars(f)
  v %>% expect_s3_class("tbl_df") %>% expect_named(c("id", "name", "type", "ndims", "natts"))
  expect_that(v$id, equals(0:3))
  expect_that(v$name, equals(c("chlor_a", "lat", "lon", "palette")))
  expect_that(v$type, equals(c("NC_FLOAT", "NC_FLOAT", "NC_FLOAT", "UNKNOWN")))
expect_that(v$ndims, equals(c(2, 1, 1, 2)))
expect_that(v$natts, equals(c(12, 5, 5, 0)))
})