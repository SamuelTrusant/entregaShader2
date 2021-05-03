#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float u_time;
uniform int color;

varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {  
  float intensity;

  intensity = max(0.0, dot(vertLightDir, vertNormal));

  switch(color){
    case 0:
  	gl_FragColor = vec4(intensity+0.2, intensity*(sin(u_time)), intensity*(-cos(u_time)/2.), 1.0);
        break;
    case 1:
   	gl_FragColor = vec4(intensity*(sin(u_time)), intensity+0.2, intensity*(-cos(u_time)/2.), 1.0);
        break;   
    default:
  	gl_FragColor = vec4(intensity*(sin(u_time)), intensity*(-cos(u_time)/2.), intensity+0.2, 1.0);
        break;
  }
}