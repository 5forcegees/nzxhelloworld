PROJECT:=quay-street-hello-world
PROJECT_DESCRIPTION:=An example project of using infra-kit

NIX_MODULES=nix pulumi aws secrets

NIX_COMMIT:=eac7da7b519a5aefe92c33c90b4450a24ebe0ab3

# --
# AWS Configuration
AWS_SSO_URL:=https://d-9767057faf.awsapps.com/start/#/
AWS_REGION:=ap-southeast-2
AWS_ROLE_DEFAULT=PowerUserAccess
AWS_ROLE_RUN=PowerUserAccess
AWS_ROLE_PROVISION=DeploymentAccess

ORG?=smartshares
ifeq ($(ORG),nzx)
AWS_ACCOUNT_DEVELOPMENT=882318459086
AWS_ACCOUNT_STAGING=793689398711
AWS_ACCOUNT_PRODUCTION=735412128195
else
AWS_ACCOUNT_DEVELOPMENT=550812963266
AWS_ACCOUNT_STAGING=550812963266
AWS_ACCOUNT_PRODUCTION=825212551933
endif

# --
# ## Pulumi Configuration
PULUMI_STACK=nzx/$(PROJECT)
PULUMI_VERSION=3.67.1
# PULUMI_DEBUG=true

PATH_LAMBDA_SOURCES=$(wildcard src/py/infrakit/examples/lambdafunctions/*.py src/py/infrakit/examples/lambdafunctions/*/*.py src/py/infrakit/examples/lambdafunctions/*/*/*.py)
ORG?=smartshares
PRODUCT_LAMBDA_ZIP=$(PATH_BUILD)/lambda-$(GIT_REVISION).zip
PATH_BUILD_LAMBDA_ZIP=$(PATH_PROJECT)/$(PRODUCT_LAMBDA_ZIP)
PATH_BUILD_SPA_LAMBDA_ZIP=$(PATH_PROJECT)/src/test/function.zip

PULUMI_ENV+=\
PRODUCT_LAMBDA_ZIP=$(PRODUCT_LAMBDA_ZIP)\
PATH_BUILD_LAMBDA_ZIP=$(PATH_BUILD_LAMBDA_ZIP)\
PROJECT=$(PROJECT)\
NEXT_DIST_PATH=$(NEXT_DIST_PATH)\
PATH_BUILD_SPA_LAMBDA_ZIP=$(PATH_BUILD_SPA_LAMBDA_ZIP)\

# --
# Python Configuration
PYTHON:=python3.9
PYTHON_VERSION:=3.9

# --
# ## Dependencies configuration
#
# We need python and openssl for runtime
USE_BIN+=python openssl env sh aws-lambda-rie zip pulumi

USE_PYTHON_MODULE=\
	pulumi:$(SOURCE_PYPI)\
	pulumi-aws:$(SOURCE_PYPI)\
	boto3:$(SOURCE_PYPI)\
	awslambdaric:$(SOURCE_PYPI)\
	buildkit:.deps/src/build-kit/src/py/buildkit

# --
# ## Bootstrapping
#
# This installs the kit and the dependencies as well
PATH_BUILDKIT?=.deps/src/build-kit
URL_BUILDKIT?=git@github.com:NZX/build-kit
GIT_SUBMODULE_COMMAND=git clone


ifeq ($(wildcard $(PATH_BUILDKIT)/.git),)
ifeq ($(strip $(shell grep "$(PATH_BUILDKIT)" .gitmodules)),)
$(info [KIT] Installing the build-kit)
_:=$(shell mkdir -p "$(dir $(PATH_BUILDKIT))" ; git clone  "$(URL_BUILDKIT)" "$(PATH_BUILDKIT)")
else
$(info [KIT] Installing the build-kit from .gitmodules)
_:=$(shell git submodule update --init --recursive; git submodule update --remote --recursive)
endif
endif
include $(PATH_BUILDKIT)/src/mk/Makefile
