const Texture = @import("texture.zig").Texture;
const TextureFormat = @import("texture.zig").TextureFormat;
const Buffer = @import("buffer.zig").Buffer;
const RenderBundleDescriptor = @import("render_bundle.zig").RenderBundleDescriptor;
const BindGroup = @import("bind_group.zig").BindGroup;
const RenderPipeline = @import("render_pipeline.zig").RenderPipeline;
const ChainedStruct = @import("types.zig").ChainedStruct;
const IndexFormat = @import("types.zig").IndexFormat;
const impl = @import("interface.zig").impl;

pub const RenderBundleEncoder = *opaque {
    pub inline fn draw(render_bundle_encoder: RenderBundleEncoder, vertex_count: u32, instance_count: u32, first_vertex: u32, first_instance: u32) void {
        impl.renderBundleEncoderDraw(render_bundle_encoder, vertex_count, instance_count, first_vertex, first_instance);
    }

    pub inline fn drawIndexed(render_bundle_encoder: RenderBundleEncoder, index_count: u32, instance_count: u32, first_index: u32, base_vertex: u32, first_instance: u32) void {
        impl.renderBundleEncoderDrawIndexed(render_bundle_encoder, index_count, instance_count, first_index, base_vertex, first_instance);
    }

    pub inline fn drawIndexedIndirect(render_bundle_encoder: RenderBundleEncoder, indirect_buffer: Buffer, indirect_offset: u64) void {
        impl.renderBundleEncoderDrawIndexedIndirect(render_bundle_encoder, indirect_buffer, indirect_offset);
    }

    pub inline fn drawIndirect(render_bundle_encoder: RenderBundleEncoder, indirect_buffer: Buffer, indirect_offset: u64) void {
        impl.renderBundleEncoderDrawIndirect(render_bundle_encoder, indirect_buffer, indirect_offset);
    }

    pub inline fn finish(render_bundle_encoder: RenderBundleEncoder, descriptor: ?*const RenderBundleDescriptor) void {
        impl.renderBundleEncoderFinish(render_bundle_encoder, descriptor);
    }

    pub inline fn insertDebugMarker(render_bundle_encoder: RenderBundleEncoder, marker_label: [*:0]const u8) void {
        impl.renderBundleEncoderInsertDebugMarker(render_bundle_encoder, marker_label);
    }

    pub inline fn popDebugGroup(render_bundle_encoder: RenderBundleEncoder) void {
        impl.renderBundleEncoderPopDebugGroup(render_bundle_encoder);
    }

    pub inline fn pushDebugGroup(render_bundle_encoder: RenderBundleEncoder, group_label: [*:0]const u8) void {
        impl.renderBundleEncoderPushDebugGroup(render_bundle_encoder, group_label);
    }

    pub inline fn setBindGroup(render_bundle_encoder: RenderBundleEncoder, group_index: u32, group: BindGroup, dynamic_offset_count: u32, dynamic_offsets: [*]const u32) void {
        impl.renderBundleEncoderSetBindGroup(render_bundle_encoder, group_index, group, dynamic_offset_count, dynamic_offsets);
    }

    pub inline fn setIndexBuffer(render_bundle_encoder: RenderBundleEncoder, buffer: Buffer, format: IndexFormat, offset: u64, size: u64) void {
        impl.renderBundleEncoderSetIndexBuffer(render_bundle_encoder, buffer, format, offset, size);
    }

    pub inline fn setLabel(render_bundle_encoder: RenderBundleEncoder, label: [*:0]const u8) void {
        impl.renderBundleEncoderSetLabel(render_bundle_encoder, label);
    }

    pub inline fn setPipeline(render_bundle_encoder: RenderBundleEncoder, pipeline: RenderPipeline) void {
        impl.renderBundleEncoderSetPipeline(render_bundle_encoder, pipeline);
    }

    pub inline fn setVertexBuffer(render_bundle_encoder: RenderBundleEncoder, slot: u32, buffer: Buffer, offset: u64, size: u64) void {
        impl.renderBundleEncoderSetVertexBuffer(render_bundle_encoder, slot, buffer, offset, size);
    }

    pub inline fn reference(render_bundle_encoder: RenderBundleEncoder) void {
        impl.renderBundleEncoderReference(render_bundle_encoder);
    }

    pub inline fn release(render_bundle_encoder: RenderBundleEncoder) void {
        impl.renderBundleEncoderRelease(render_bundle_encoder);
    }
};

pub const RenderBundleEncoderDescriptor = extern struct {
    next_in_chain: *const ChainedStruct,
    label: ?[*:0]const u8 = null,
    color_formats_count: u32,
    color_formats: [*]const TextureFormat,
    depth_stencil_format: TextureFormat,
    sample_count: u32,
    depth_read_only: bool,
    stencil_read_only: bool,
};
