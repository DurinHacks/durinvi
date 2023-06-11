struct VSIN
{
    float2 Position         : POSITION0;
    float2 TexCoords        : TEXCOORD0;
    float4 Color            : COLOR0;
	float4x4 InstanceTrfo   : INSTMAT;
	float4 InstanceColor	: COLOR1;
    float InstanceLayer     : LAYER0;
};
struct PSIN
{
    float4 PositionWS   : SV_POSITION;
    float2 TexCoords    : TEXCOORD0;
    float4 Color        : COLOR0;
};

PSIN main(VSIN Input)
{
    PSIN Output;

    Output.PositionWS   = mul(float4(Input.Position, 0.0f, 1.0f), Input.InstanceTrfo);
    Output.PositionWS.x /= 1366;
    Output.PositionWS.y /= 768;
    Output.PositionWS.z = Input.InstanceLayer;
    Output.TexCoords    = Input.TexCoords;
    Output.Color        = Input.InstanceColor;

    return Output;
}
