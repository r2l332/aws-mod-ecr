output "ecr_ireland" {
  value = [
    for arn, name in zipmap(
      sort(values(aws_ecr_repository.repo)[*]["arn"]),
    sort(values(aws_ecr_repository.repo)[*]["name"])) :
    map("name", name)
  ]
}
output "ecr_london" {
  value = [
    for arn, name in zipmap(
      sort(values(aws_ecr_repository.repo-london)[*]["arn"]),
    sort(values(aws_ecr_repository.repo-london)[*]["name"])) :
    map("name", name)
  ]
}
output "ecr_frankfurt" {
  value = [
    for arn, name in zipmap(
      sort(values(aws_ecr_repository.repo-frankfurt)[*]["arn"]),
    sort(values(aws_ecr_repository.repo-frankfurt)[*]["name"])) :
    map("name", name)
  ]
}