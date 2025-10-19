void CustomLighting(inout SurfaceDescription surface, out float3 color)
{
    Light light = GetMainLight();
    float NdotL = saturate(dot(surface.NormalWS, light.Direction));
    float atten = MainLightRealtimeShadow(light.ShadowCoord);
    atten = lerp(1, atten, _ShadowStrength); // 阴影淡化
    color = surface.Albedo * NdotL * atten;
}
