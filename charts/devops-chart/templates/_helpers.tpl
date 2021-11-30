{{- define "limitsAndRequests" -}}
{{- $memLimits := dict "XS" "128" "S" "256" "M" "512" "L" "2048" "XL" "4096" -}}
{{- $memRequests := dict "XS" "64" "S" "128" "M" "256" "L" "1024" "XL" "2048" -}}
{{- $cpuLimits := dict "XS" "500m" "S" "1" "M" "1.6" "L" "2.4" "XL" "4" -}}
{{- $cpuRequests := dict "XS" "250m" "S" "500m" "M" "800m" "L" "1.2" "XL" "2" -}}
{{- $memLimit := index $memLimits $.Values.resources.size -}}
{{- $cpuLimit := index $cpuLimits $.Values.resources.size -}}
{{- $memRequest := index $memRequests $.Values.resources.size -}}
{{- $cpuRequest := index $cpuRequests $.Values.resources.size -}}
limits:
  memory: {{$memLimit}}Mi
  cpu: {{$cpuLimit}}
requests:
  memory: {{$memRequest}}Mi
  cpu: {{$cpuRequest}}
{{- end -}}
