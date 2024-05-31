#include "AbilityTimer.h"

AbilityTimer::AbilityTimer(uint32_t abilityId, uint32_t minimumCooldownMs, uint32_t maximumCooldownMs)
    : AbilityTimer(abilityId, minimumCooldownMs, maximumCooldownMs, urand(minimumCooldownMs, maximumCooldownMs))
{
}

AbilityTimer::AbilityTimer(uint32_t abilityId, uint32_t minimumCooldownMs, uint32_t maximumCooldownMs, uint32_t initialDelayMs)
{
    m_abilityId = abilityId;
    m_minimumCooldownMs = minimumCooldownMs;
    m_maximumCooldownMs = maximumCooldownMs;
    m_currentCooldownMs = initialDelayMs;
}

bool AbilityTimer::is_ready() const
{
    return m_currentCooldownMs == 0;
}

uint32_t AbilityTimer::spell_id() const
{
    return m_abilityId;
}

void AbilityTimer::reset()
{
    m_currentCooldownMs = urand(m_minimumCooldownMs, m_maximumCooldownMs);
}

void AbilityTimer::set_cooldown(uint32_t cooldownMs)
{
    m_currentCooldownMs = cooldownMs;
}

void AbilityTimer::update(uint32_t delta)
{
    if (m_currentCooldownMs > 0)
    {
        m_currentCooldownMs = delta > m_currentCooldownMs ? 0 : m_currentCooldownMs - delta;
    }
}
