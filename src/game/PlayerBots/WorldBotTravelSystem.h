#ifndef MANGOS_WorldBotTravelSystem_H
#define MANGOS_WorldBotTravelSystem_H

#include <vector>
#include <map>
#include <cmath>
#include <unordered_map>
#include <vector>
#include <random>
#include <algorithm>
#include <type_traits>
#include <limits>
#include "SharedDefines.h"
#include "Platform/Define.h"
#include "Player.h"

class WorldBotAI;

enum class TravelNodePathType : uint8
{
    None = 0,
    Walk = 1,
    AreaTrigger = 2,
    Transport = 3,
    FlightPath = 4,
    TeleportSpell = 5,
    StaticPortal = 6
};

struct TravelNode
{
    uint32 id;
    std::string name;
    uint32 mapId;
    float x, y, z;
    bool linked;
    uint32 objectId = 0; // For storing portal/area trigger IDs
};

struct TravelNodeLink
{
    uint32 nodeId;
    uint32 toNodeId;
    uint32 type;
    uint32 object;
    float distance;
    float swimDistance;
    uint32 extraCost;
    bool calculated;
    uint32 maxCreature[3];
};

struct TravelPath
{
    uint32 nodeId;
    uint32 toNodeId;
    uint32 nr;
    uint32 mapId;
    float x, y, z;
};


#define SPELL_UNDYING_SOUL 20939

class WorldBotTravelSystem
{
public:
    static WorldBotTravelSystem* instance()
    {
        static WorldBotTravelSystem instance;
        return &instance;
    }

    // Loaders
    void LoadTravelNodes();
    void LoadTravelNodeLinks();
    void LoadTravelPaths();

    void ReloadTravelPaths()
    {
        m_travelPaths.clear();
        LoadTravelPaths();
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WorldBotTravelSystem: Travel paths reloaded.");
    };

    // Functions
    TravelNode const* GetNearestNode(float x, float y, float z, uint32 mapId) const;
    const TravelPath* GetPathBetweenNodes(uint32 fromNodeId, uint32 toNodeId) const;
    std::vector<uint32> GetPathToPosition(float x, float y, float z, uint32 mapId) const;
    uint32 GetNearestNodeId(float x, float y, float z, uint32 mapId) const;
    bool CanReachByWalking(uint32 startNodeId, uint32 endNodeId) const;
    bool AreNodesConnected(uint32 startNodeId, uint32 endNodeId) const;
    std::vector<TravelPath> FindPath(uint32 startNodeId, uint32 endNodeId, bool isCorpseRun = false, bool allowFlightPaths = true) const;
    float HeuristicCostEstimate(uint32 fromNodeId, uint32 toNodeId) const;
    float GetPathCost(uint32 fromNodeId, uint32 toNodeId, bool isCorpseRun = false, bool allowFlightPaths = true) const;
    std::vector<TravelPath> FindPathWithoutFlightPaths(uint32 startNodeId, uint32 endNodeId) const;
    float GetPathCostWithoutFlightPaths(uint32 fromNodeId, uint32 toNodeId) const;
    bool IsFlightPathLink(uint32 fromNodeId, uint32 toNodeId) const;
    std::vector<TravelPath> ReconstructPath(const std::unordered_map<uint32, uint32>& cameFrom, const std::unordered_map<uint32, TravelNodePathType>& linkTypes, uint32 current) const;
    TravelPath GetTravelPathForNode(uint32 nodeId) const;
    uint32 GetRandomNodeId(uint32 mapId, uint32 startNodeId);

    const TravelNode* GetNode(uint32 nodeId) const
    {
        auto it = m_travelNodes.find(nodeId);
        return it != m_travelNodes.end() ? &it->second : nullptr;
    }

    std::pair<std::multimap<uint32, TravelNodeLink>::const_iterator, std::multimap<uint32, TravelNodeLink>::const_iterator>
    GetNodeLinks(uint32 nodeId) const
    {
        return m_travelNodeLinks.equal_range(nodeId);
    }

    bool ResumePath(WorldBotAI* botAI);

    const std::map<uint32, TravelNode>& GetAllNodes() const { return m_travelNodes; }
    const std::multimap<uint32, TravelNodeLink>& GetAllNodeLinks() const { return m_travelNodeLinks; }
    const std::multimap<std::pair<uint32, uint32>, TravelPath>& GetAllTravelPaths() const { return m_travelPaths; }

    std::pair<std::multimap<std::pair<uint32, uint32>, TravelPath>::const_iterator, std::multimap<std::pair<uint32, uint32>, TravelPath>::const_iterator> GetAllPathsFromNode(uint32 nodeId) const;

    // Path and Node visuals
    void ShowCurrentPath(Player* me, const std::vector<TravelPath>& currentPath, size_t currentPathIndex, uint32 currentNodeId);
    void ShowAllPathsAndNodes(Player* me);
    void ClearPathVisuals(Player* me);
    void VisualizeNode(Player* player, const TravelNode* node);
    void VisualizePath(Player* player, const std::vector<TravelPath>& path);
    void VisualizeAllNodes(Player* player);
    void VisualizeAllPaths(Player* player, const std::vector<TravelPath>& paths);

    float GetAveragePathFindingTime() const;
    uint32 GetTotalPathsFound() const;
    uint32 GetFailedPathFindings() const;
    float GetAverageNodeActionsPerSecond() const;

    // Primary template for GetDistance3D
    template<class A, class B>
    static float GetDistance3D(A const& from, B const& to)
    {
        float dx = from.x - to.x;
        float dy = from.y - to.y;
        float dz = from.z - to.z;
        float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
        return (dist > 0 ? dist : 0);
    }

    // Specialization for Player
    template<class B>
    static float GetDistance3D(Player const& from, B const& to)
    {
        float dx = from.GetPositionX() - to.x;
        float dy = from.GetPositionY() - to.y;
        float dz = from.GetPositionZ() - to.z;
        float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
        return (dist > 0 ? dist : 0);
    }

    // Specialization for when both are Players
    static float GetDistance3D(Player const& from, Player const& to)
    {
        float dx = from.GetPositionX() - to.GetPositionX();
        float dy = from.GetPositionY() - to.GetPositionY();
        float dz = from.GetPositionZ() - to.GetPositionZ();
        float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
        return (dist > 0 ? dist : 0);
    }

    float GetDistance3D(float x1, float y1, float z1, const TravelPath& point)
    {
        float dx = x1 - point.x;
        float dy = y1 - point.y;
        float dz = z1 - point.z;
        return std::sqrt(dx * dx + dy * dy + dz * dz);
    }

    static float GetDistance3D(const Player* player, float x, float y, float z)
    {
        float dx = player->GetPositionX() - x;
        float dy = player->GetPositionY() - y;
        float dz = player->GetPositionZ() - z;
        float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
        return (dist > 0 ? dist : 0);
    }

    static float GetDistance3D(float x1, float y1, float z1, float x2, float y2, float z2)
    {
        float dx = x1 - x2;
        float dy = y1 - y2;
        float dz = z1 - z2;
        return std::sqrt(dx * dx + dy * dy + dz * dz);
    }

    std::map<uint32, TravelNode> m_travelNodes;
    std::multimap<uint32, TravelNodeLink> m_travelNodeLinks;
    std::multimap<std::pair<uint32, uint32>, TravelPath> m_travelPaths;

    std::unordered_map<uint32, std::vector<uint32>> m_mapNodeIds;
    std::unordered_map<uint32, std::vector<uint32>> m_nodeConnections;

private:
    WorldBotTravelSystem(); // Declaration only
    ~WorldBotTravelSystem();

    // Prevent copying
    WorldBotTravelSystem(const WorldBotTravelSystem&) = delete;
    WorldBotTravelSystem& operator=(const WorldBotTravelSystem&) = delete;

    mutable std::mt19937 m_randomGenerator;

    struct NodeDistance
    {
        uint32 nodeId;
        float distance;

        NodeDistance(uint32 id, float dist) : nodeId(id), distance(dist) {}

        bool operator>(const NodeDistance& other) const
        {
            return distance > other.distance;
        }
    };

    // Path and Node visuals
    std::map<ObjectGuid, std::vector<ObjectGuid>> m_pathVisuals;

    // Performance tracking
    mutable uint32 m_totalPathFindingTime;
    mutable uint32 m_totalPathsFound;
    mutable uint32 m_failedPathFindings;
    mutable uint32 m_totalNodeActions;
    mutable uint32 m_lastNodeActionReset;
};

// Define a convenient macro
#define sWorldBotTravelSystem (*WorldBotTravelSystem::instance())

#endif

