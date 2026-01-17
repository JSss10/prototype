'use client'

import { useEffect, useState } from 'react'
import { getSupabaseBrowserClient } from '@/lib/supabase/browser-client'
import { Landmark, Category } from '@/lib/supabase/types'

export default function Home() {
  const [landmarks, setLandmarks] = useState<Landmark[]>([])
  const [categories, setCategories] = useState<Category[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchData() {
      const supabase = getSupabaseBrowserClient()

      try {
        const { data: landmarksData, error: landmarksError } = await supabase
          .from('landmarks')
          .select(`
            *,
            category:categories(*)
          `)
          .order('name')

        if (landmarksError) throw landmarksError

        const { data: categoriesData, error: categoriesError } = await supabase
          .from('categories')
          .select('*')
          .order('sort_order')

        if (categoriesError) throw categoriesError

        setLandmarks(landmarksData || [])
        setCategories(categoriesData || [])
      } catch (err) {
        setError(err instanceof Error ? err.message : 'A error occurred')
      } finally {
        setLoading(false)
      }
    }

    fetchData()
  }, [])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-xl">Loading...</div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-xl text-red-500">Error: {error}</div>
      </div>
    )
  }

  return (
    <main className="min-h-screen p-8 bg-gray-50">
      <div className="max-w-6xl mx-auto">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">
            Dashboard
          </h1>
          <p className="text-gray-600 mt-2">
            Manage landmarks for the AR prototype
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
          <div className="bg-white p-6 rounded-lg shadow">
            <div className="text-2xl font-bold text-blue-600">
              {landmarks.length}
            </div>
            <div className="text-gray-600">Landmarks</div>
          </div>
          <div className="bg-white p-6 rounded-lg shadow">
            <div className="text-2xl font-bold text-green-600">
              {categories.length}
            </div>
            <div className="text-gray-600">Categories</div>
          </div>
          <div className="bg-white p-6 rounded-lg shadow">
            <div className="text-2xl font-bold text-purple-600">
              {landmarks.filter(l => l.is_active).length}
            </div>
            <div className="text-gray-600">Active entries</div>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow overflow-hidden">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-xl font-semibold">Landmarks</h2>
          </div>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Name
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Category
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Coordinates
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Year built
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Status
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {landmarks.map((landmark) => (
                  <tr key={landmark.id} className="hover:bg-gray-50">
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div className="font-medium text-gray-900">
                        {landmark.name}
                      </div>
                      <div className="text-sm text-gray-500">
                        {landmark.name_en}
                      </div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      {landmark.category && (
                        <span
                          className="px-2 py-1 text-xs rounded-full"
                          style={{
                            backgroundColor: `${landmark.category.color}20`,
                            color: landmark.category.color
                          }}
                        >
                          {landmark.category.icon} {landmark.category.name}
                        </span>
                      )}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {landmark.latitude.toFixed(4)}, {landmark.longitude.toFixed(4)}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {landmark.year_built || '–'}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`px-2 py-1 text-xs rounded-full ${landmark.is_active
                        ? 'bg-green-100 text-green-800'
                        : 'bg-red-100 text-red-800'
                        }`}>
                        {landmark.is_active ? 'Active' : 'Inactive'}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </main>
  )
}