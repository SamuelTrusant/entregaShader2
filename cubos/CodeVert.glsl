// Toon shader using per-pixel lighting. Based on the glsl 
// tutorial from lighthouse 3D:
// http://www.lighthouse3d.com/tutorials/glsl-tutorial/toon-shader-version-ii/

#define PROCESSING_LIGHT_SHADER

uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec3 lightNormal[8];

attribute vec4 vertex;
attribute vec3 normal;

varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  gl_Position = transform * vertex;
  vertNormal = normalize(normalMatrix * normal);  
  vertLightDir = -lightNormal[0]; 
}