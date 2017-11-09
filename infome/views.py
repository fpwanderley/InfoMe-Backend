from django.shortcuts import render
from rest_framework.schemas import get_schema_view
from rest_framework_swagger.renderers import SwaggerUIRenderer, OpenAPIRenderer

# Create your views here.
# View for accessing the Swagger interface.
schema_view = get_schema_view(title='InfoMe API', renderer_classes=[OpenAPIRenderer, SwaggerUIRenderer])
