void ShadowFactor_float(float3 WorldPos, in float4 ShadowColor, out float3 ShadowAtten)
{
	// set the shader graph node previews
#ifdef SHADERGRAPH_PREVIEW
		ShadowAtten = float3(0.5,0.5,0);
#else

		// grab the shadow coordinates
#if SHADOWS_SCREEN
		half4 shadowCoord = ComputeScreenPos(ClipSpacePos);
#else
		half4 shadowCoord = TransformWorldToShadowCoord(WorldPos);
#endif 

		// grab the main light
#if _MAIN_LIGHT_SHADOWS_CASCADE || _MAIN_LIGHT_SHADOWS
		Light light = GetMainLight(shadowCoord);
#else
		Light light = GetMainLight();
#endif
		// �����������ɫ������Ӱ�ı������,��ͬʱ��������ɫ��Ӱ�᲻����Ȼ
        // ShadowAtten = light.color * (light.shadowAttenuation + ShadowColor * (1 - light.shadowAttenuation));
		
		// ����ɫ��Ӱ�������Ȼ, ����������ɫ��������Ӱ�ı�
		ShadowAtten = light.color * (light.shadowAttenuation + ShadowColor);
#endif

}
