test_that("enumerate", {
  
  x <- torch_randn(100, 100)
  y <- torch_randn(100, 1)
  dataset <- tensor_dataset(x, y)
  dl <- dataloader(dataset = dataset, batch_size = 32)
  
  i <- 1
  for (b in enumerate(dl)) {
    expect_equal_to_tensor(b[[1]], x[(1 + (i-1)*32):((i)*32),,drop=FALSE])
    expect_equal_to_tensor(b[[2]], y[(1 + (i-1)*32):((i)*32),,drop=FALSE])  
    i <- i + 1
  }
  
})