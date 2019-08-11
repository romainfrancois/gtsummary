context("test-add_p")

test_that("add_p creates output without error/warning", {
  expect_error(
    tbl_summary(mtcars, by = am) %>% add_p(),
    NA
  )
  expect_warning(
    tbl_summary(mtcars, by = am) %>% add_p(),
    NA
  )

  expect_error(
    tbl_summary(trial, by = trt, group = response) %>%
      add_p(test = everything() ~ "lme4"),
    NA
  )
})

test_that("add_p creates errors when non-function in input", {
  expect_error(
    tbl_summary(mtcars, by = am) %>%
      add_p(pvalue_fun = mtcars),
    "*"
  )
})