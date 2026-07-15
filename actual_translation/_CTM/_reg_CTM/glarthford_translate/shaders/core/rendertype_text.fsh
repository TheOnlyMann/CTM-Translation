#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

uniform vec2 ScreenSize;

in float vertexDistance;
in vec4 vertexColor;
in vec4 textColor;
in vec2 texCoord0;
in float depthLevel;
in vec2 texOffset;

out vec4 fragColor;

#define EQ(a,b) (length(a - b) < 0.003)
#define TITLE_Z_LAYER 0.12
#define SUBTITLE_Z_LAYER 0.06

void main() {
	vec4 color = texture(Sampler0, texCoord0 - texOffset) * vertexColor * ColorModulator;
	if (color.a < 0.1) {
		discard;
	}
	
	if(EQ(textColor.rg, vec2(0.0, 0.0)) && (depthLevel == TITLE_Z_LAYER || depthLevel == SUBTITLE_Z_LAYER)) {
		fragColor = vec4(vec3((textColor.b*255.0/20.0) - ((gl_FragCoord.x-(ScreenSize.x*0.25))/(ScreenSize.x*0.6))), 1.0);
	} else if(EQ(textColor.rg, vec2(0.0, 1.0/255.0)) && (depthLevel == TITLE_Z_LAYER || depthLevel == SUBTITLE_Z_LAYER)) {
		if((textColor.b*255.0/20.0) - ((gl_FragCoord.x-(ScreenSize.x*0.25))/(ScreenSize.x*0.6)) > 0.5) fragColor = vec4(170.0/255.0, 0.0, 0.0, 1.0);
		else fragColor = vec4(0.0);
	} else if(textColor.a == 254.0/255.0) {
        if(depthLevel == 0.00) discard;
        else fragColor = linear_fog(vec4(color.rgb, 1.0), vertexDistance, FogStart, FogEnd, FogColor);
    } else {
		fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
	}
    
}
