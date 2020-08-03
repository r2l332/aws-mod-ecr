resource "aws_ecr_repository" "repo" {
  for_each = toset(local.repos)
  name     = each.value
  tags     = local.common_tags
  provider = aws.ireland
}
resource "aws_ecr_repository" "repo-london" {
  for_each = toset(local.repos)
  name     = each.value
  tags     = local.common_tags
  provider = aws.london
}
resource "aws_ecr_repository" "repo-frankfurt" {
  for_each = toset(local.repos)
  name     = each.value
  tags     = local.common_tags
  provider = aws.frankfurt
}

resource "aws_ecr_repository" "policy" {
  for_each   = toset(local.repos)
  policy     = data.aws_iam_policy_document.repo-policy.json
  repository = aws_ecr_repository.repo[each.value].name
  provider   = aws.ireland
}
resource "aws_ecr_repository" "policy-london" {
  for_each   = toset(local.repos)
  policy     = data.aws_iam_policy_document.repo-policy.json
  repository = aws_ecr_repository.repo[each.value].name
  provider   = aws.london
}
resource "aws_ecr_repository" "policy-frankfurt" {
  for_each   = toset(local.repos)
  policy     = data.aws_iam_policy_document.repo-policy.json
  repository = aws_ecr_repository.repo[each.value].name
  provider   = aws.frankfurt
}

resource "aws_ecr_lifecycle_policy" "lifecycle" {
  for_each   = toset(local.repos)
  policy     = file("${path.module}/files/lifecycle_policy.json")
  repository = aws_ecr_repository.repo[each.value].name
  provider   = aws.ireland
  depends_on = [
    aws_ecr_repository.repo,
  ]
}
resource "aws_ecr_lifecycle_policy" "lifecycle-london" {
  for_each   = toset(local.repos)
  policy     = file("${path.module}/files/lifecycle_policy.json")
  repository = aws_ecr_repository.repo-london[each.value].name
  provider   = aws.ireland
  depends_on = [
    aws_ecr_repository.repo-london,
  ]
}
resource "aws_ecr_lifecycle_policy" "lifecycle-frankfurt" {
  for_each   = toset(local.repos)
  policy     = file("${path.module}/files/lifecycle_policy.json")
  repository = aws_ecr_repository.repo-frankfurt[each.value].name
  provider   = aws.ireland
  depends_on = [
    aws_ecr_repository.repo-frankfurt,
  ]
}