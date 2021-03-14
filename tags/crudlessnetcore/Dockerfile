FROM daocloud.io/library/node:12 as cli
WORKDIR /usr/src
RUN git -c http.sslVerify=false clone https://github.com/kequandian/hub.crudless.zerocode --branch cli.netcore --single-branch cli
WORKDIR /usr/src/cli

FROM mcr.microsoft.com/dotnet/runtime:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY --from=cli "/usr/src/cli/crudless.netcore.csproj" "./"
RUN dotnet restore "crudless.netcore.csproj"
COPY --from=cli /usr/src/cli .
WORKDIR "/src/."
RUN dotnet build "crudless.netcore.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "crudless.netcore.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "crudless.netcore.dll"]
