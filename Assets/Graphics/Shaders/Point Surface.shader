Shader "Graph/Point Surface"{
	Properties{
			_Smoothness("Smoothness", Range(0,1)) = 0.5
	}
	SubShader{
		CGPROGRAM

		#pragma surface ConfigureSurface Standard fullforwardshadows
		#pragma target 3.0
		struct Input {
			float3 worldPos;
		};

		float _Smoothness;

		void ConfigureSurface(Input input, inout SurfaceOutputStandard surface) {
			surface.Smoothness = _Smoothness;
			surface.Albedo.r = saturate( (input.worldPos.x+10)/20 );
			surface.Albedo.g = saturate( (input.worldPos.y+1) * 0.5 );
			surface.Albedo.b = saturate( (input.worldPos.z + 10)/20);
		}

		ENDCG	
	}

	FallBack "Diffuse"
}