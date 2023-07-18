import os
import sys

PATH_PROJECT = os.environ["PATH_PROJECT"]

sys.path.insert(1, f"{PATH_PROJECT}/src/py/")

from infrakit.patterns.spa import SPA
from infrakit.examples.lambdafunctions import default, demo


PROJECT = "example-project"
AWS_REGION = "ap-southeast-2"
AWS_ACCOUNT = "882318459086"
ENVIRONMENT = "development"
PATH_BUILD_LAMBDA_ZIP = os.environ["PATH_BUILD_LAMBDA_ZIP"]


apiDomains = {
    "development": "development-example-project-tasks.nzx.dev",
    # NOTE: staging and production are not implemented yet.
}

spaPublicDomains = {
    "development": "development-example-project-www.nzx.dev",
    # NOTE: staging and production are not implemented yet.
}


def main():
    app = SPA(
        projectName=PROJECT,
        pathProject=PATH_PROJECT,
        environment=ENVIRONMENT,
        lambdaAPIDomainName=apiDomains[ENVIRONMENT],
        publicDomainName=spaPublicDomains[ENVIRONMENT],
        awsRegion=AWS_REGION,
        pathBuildLambdaZip=PATH_BUILD_LAMBDA_ZIP,
        defaultLambdaModule=default,
    )
    app.publicAPI(
        name="example",
        module=default,
        apiURI="/example",
    )
    app.publicAPI(
        name="demo",
        module=demo,
        apiURI="/demo",
    )


main()
