uniform float uPixelRatio;
uniform float uSize;
attribute float aScale;
uniform float uTime;

void main()
{
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  modelPosition.x += sin(uTime + modelPosition.x * 100.0) * aScale * 0.3;
  modelPosition.y += sin(uTime + modelPosition.y * 100.0) * aScale * 0.5;
  modelPosition.z += sin(uTime + modelPosition.z * 100.0) * aScale * 0.4;
  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;

  gl_Position = projectionPosition;
  gl_PointSize = uSize * uPixelRatio;
  gl_PointSize *= (1.0 / - viewPosition.z);
}