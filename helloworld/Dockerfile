# simple builder pattern
# i hit this https://forums.docker.com/t/dotnet-restore-never-completes-on-m1-mac-when-targeting-linux-amd64-platform/132337/6
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore

COPY Program.cs ./
RUN dotnet publish helloworld.csproj --runtime linux-musl-x64 -o out -p:PublishTrimmed=true

FROM  mcr.microsoft.com/dotnet/aspnet:7.0.2-alpine3.17-amd64
WORKDIR /app
COPY --from=build-env /app/out .

RUN adduser --disabled-password --system --uid 1000 --home /app --gecos "" dotnetuser && chown -R dotnetuser /app

USER dotnetuser

EXPOSE 5005
# dont run as root.. so can set a sec context
ENTRYPOINT ["dotnet", "helloworld.dll"]

# can trim this assembly and make smaller but im on a mac m1
# dotnet publish helloworld.csproj --runtime linux-musl-x64 -o out -p:PublishTrimmed=true
# i am on a MacM1 so the root container will  need changing to X64 version when runnig on a prod cluster

# if time build self container image https://itnext.io/smaller-docker-images-for-asp-net-core-apps-bee4a8fd1277