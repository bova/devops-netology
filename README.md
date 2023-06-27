# devops-netology

First commit

## Gitignore

Сгластно правилам в файле /terraform/.gitignore будут проигнорированы следующие файлы

```
# Local .terraform directories
**/.terraform/* - все скрытые директории .terraform и их содержимое

# .tfstate files
*.tfstate - Все файлы с расширением .tfstate
*.tfstate.* - все файлы содержащие в совем названии .tfstate.

# Crash log files
crash.log - файлы с именем crash.log
crash.*.log - файлы начинающиеся на "crash." и имеющие расширение .log

# Exclude all .tfvars files, which are likely to contain sensitive data, such as
# password, private keys, and other secrets. These should not be part of version 
# control as they are data points which are potentially sensitive and subject 
# to change depending on the environment.
*.tfvars - файлы с рсширением tfvars
*.tfvars.json - файлы оканчивающиеся на tfvars.json

# Ignore override files as they are usually used to override resources locally and so
# are not checked in
override.tf - все файлы с именем override.tf
override.tf.json - все файлы с именем override.tf.json
*_override.tf - все файлы оканчивающиеся на _override.tf
*_override.tf.json - все файлы оканчивающиеся на _override.tf.json

# Include override files you do wish to add to version control using negated pattern
# !example_override.tf

# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*

# Ignore CLI configuration files
.terraformrc - все файлы .terraformrc
terraform.rc - все файлы terraform.rc
```


FIX line some bug

Test GUI GIT

