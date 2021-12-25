{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-bootstrap-wrapper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8s-bootstrap-wrapper.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-bootstrap-wrapper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-bootstrap-wrapper.labels" -}}
helm.sh/chart: {{ include "k8s-bootstrap-wrapper.chart" . }}
{{ include "k8s-bootstrap-wrapper.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-bootstrap-wrapper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-bootstrap-wrapper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "k8s-bootstrap-wrapper.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- $clusterBootStrapper :=  default .Values.serviceAccount.name .Values.global.serviceAccount.name -}}
{{- default (include "k8s-bootstrap-wrapper.fullname" .) $clusterBootStrapper }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "k8s-bootstrap-wrapper.argoworkflowsHelm" -}}
chartName: "argo-workflows"
releaseName: multi-card
chartVersion: "~0.8.0"
namespace: "argo-workflows"
chartsUrl: https://argoproj.github.io/argo-helm
{{- end }}