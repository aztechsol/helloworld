
modified dotnet console app to use "Microsoft.NET.Sdk.Web"

+ dotnet add package Serilog.AspNetCore
+ dotnet add package Prometheus-net.AspNetCore
+ dotnet add package Prometheus-net
+ dotnet build or watch

Metrics are exposed at /metrics
Logging is with serilog 

---
to build container and push to ECR run build.sh

---
Todo
+  health check endpoints /healthz etc
+  startup stats
+  modify what we log etc and when
+  add tracing eg opentelemetry
  